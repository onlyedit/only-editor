;;; init-edit.el --- Save and restore editor sessions between restarts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun too-long-file-p ()
  "Check whether the file is too long."
  (or (> (buffer-size) 500000)
   (and (fboundp 'buffer-line-statistics)
     (> (car (buffer-line-statistics)) 10000))))

;; hard to use
;; Minor mode to aggressively keep your code always indented
;; (use-package aggressive-indent
;;   :diminish
;;   :hook ((after-init . global-aggressive-indent-mode)
;;         ;; NOTE: Disable in large files due to the performance issues
;;         ;; https://github.com/Malabarba/aggressive-indent-mode/issues/73
;;         (find-file . (lambda ()
;;                       (when (too-long-file-p)
;;                         (aggressive-indent-mode -1)))))
;;   :config
;;   ;; Disable in some modes
;;   (dolist (mode '(gitconfig-mode
;;                  asm-mode web-mode html-mode css-mode
;;                  go-mode scala-mode
;;                  shell-mode term-mode vterm-mode
;;                  prolog-inferior-mode))
;;    (add-to-list 'aggressive-indent-excluded-modes mode))

;;   ;; Disable in some commands
;;   (add-to-list 'aggressive-indent-protected-commands #'delete-trailing-whitespace t)

;;   ;; Be slightly less aggressive in C/C++/C#/Java/Go/Swift
;;   (add-to-list 'aggressive-indent-dont-indent-if
;;               '(and (derived-mode-p 'c-mode 'c++-mode 'csharp-mode
;;                                    'java-mode 'go-mode 'swift-mode)
;;                    (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
;;                                       (thing-at-point 'line))))))

;; Show number of matches in mode-line while searching
(use-package anzu
  :diminish
  :bind (([remap query-replace] . anzu-query-replace)
     ([remap query-replace-regexp] . anzu-query-replace-regexp)
     :map isearch-mode-map
     ([remap isearch-query-replace] . anzu-isearch-query-replace)
     ([remap isearch-query-replace-regexp] . anzu-isearch-query-replace-regexp))
  :hook (after-init . global-anzu-mode))

;; Redefine M-< and M-> for some modes
(use-package beginend
  :diminish beginend-global-mode
  :hook (after-init . beginend-global-mode)
  :config (mapc (lambda (pair)
                  (diminish (cdr pair)))
                beginend-modes))

;; Drag stuff (lines, words, region, etc...) around
(use-package drag-stuff
  :diminish
  :autoload drag-stuff-define-keys
  :hook (after-init . drag-stuff-global-mode)
  :config
  (add-to-list 'drag-stuff-except-modes 'org-mode)
  (drag-stuff-define-keys))

;; A comprehensive visual interface to diff & patch
(use-package ediff
  :ensure nil
  :hook(;; show org ediffs unfolded
        (ediff-prepare-buffer . outline-show-all)
        ;; restore window layout when done
        (ediff-quit . winner-undo))
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally
        ediff-merge-split-window-function 'split-window-horizontally))

;; Visual `align-regexp'
(use-package ialign
  :ensure t)

;; Edit multiple regions in the same way simultaneously
(use-package iedit
  :ensure t
  :defines desktop-minor-mode-table
  :bind (("C-;" . iedit-mode)
         ("C-x r RET" . iedit-rectangle-mode)
         :map isearch-mode-map ("C-;" . iedit-mode-from-isearch)
         :map esc-map ("C-;" . iedit-execute-last-modification)
         :map help-map ("C-;" . iedit-mode-toggle-on-function))
  :config
  ;; Avoid restoring `iedit-mode'
  (with-eval-after-load 'desktop
    (add-to-list 'desktop-minor-mode-table
                 '(iedit-mode nil))))

;; Increase selected region by semantic units
(use-package expand-region
  :bind ("M-h" . er/expand-region)
  :config
  (defun treesit-mark-bigger-node ()
    "Use tree-sitter to mark regions."
    (let* ((root (treesit-buffer-root-node))
           (node (treesit-node-descendant-for-range root (region-beginning) (region-end)))
           (node-start (treesit-node-start node))
           (node-end (treesit-node-end node)))
      ;; Node fits the region exactly. Try its parent node instead.
      (when (and (= (region-beginning) node-start) (= (region-end) node-end))
        (when-let ((node (treesit-node-parent node)))
          (setq node-start (treesit-node-start node)
                node-end (treesit-node-end node))))
      (set-mark node-end)
      (goto-char node-start)))
  (add-to-list 'er/try-expand-list 'treesit-mark-bigger-node))

;; Smartly select region, rectangle, multi cursors
(use-package smart-region
  :hook (after-init . smart-region-on))

;; On-the-fly spell checker
(use-package flyspell
  :ensure nil
  :diminish
  :if (executable-find "aspell")
  :hook (((text-mode outline-mode) . flyspell-mode)
         ;; (prog-mode . flyspell-prog-mode)
         (flyspell-mode . (lambda ()
                            (dolist (key '("C-;" "C-," "C-."))
                              (unbind-key key flyspell-mode-map)))))
  :init (setq flyspell-issue-message-flag nil
              ispell-program-name "aspell"
              ispell-extra-args '("--sug-mode=ultra" "--lang=en_US" "--run-together")))

;; Hungry deletion
(use-package hungry-delete
  :diminish
  :hook (after-init . global-hungry-delete-mode)
  :init (setq hungry-delete-chars-to-skip " \t\f\v"
              hungry-delete-except-modes
              '(help-mode minibuffer-mode minibuffer-inactive-mode calc-mode)))

;; Move to the beginning/end of line or code
(use-package mwim
  :bind (([remap move-beginning-of-line] . mwim-beginning)
         ([remap move-end-of-line] . mwim-end)))

;; Treat undo history as a tree
(use-package vundo
  :bind ("C-x u" . vundo)
  :config (setq vundo-glyph-alist vundo-unicode-symbols))
(use-package undo-tree
  :diminish
  :hook (after-init . global-undo-tree-mode)
  :init (setq undo-tree-visualizer-timestamps t
              undo-tree-visualizer-diff t
              undo-tree-enable-undo-in-region nil
              undo-tree-auto-save-history nil
	      evil-set-undo-system 'undo-tree))

;; Goto last change
(use-package goto-chg
  :bind ("C-," . goto-last-change))

;; Handling capitalized subwords in a nomenclature
(use-package subword
  :ensure nil
  :diminish
  :hook ((prog-mode . subword-mode)
         (minibuffer-setup . subword-mode)))

(provide 'init-edit)

;;; end init-edit.el
