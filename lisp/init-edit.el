;;; init-edit.el --- Save and restore editor sessions between restarts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; Show number of matches in mode-line while searching
(use-package anzu
  :ensure t
  :bind (([remap query-replace] . anzu-query-replace)
     ([remap query-replace-regexp] . anzu-query-replace-regexp)
     :map isearch-mode-map
     ([remap isearch-query-replace] . anzu-isearch-query-replace)
     ([remap isearch-query-replace-regexp] . anzu-isearch-query-replace-regexp))
  :hook (after-init . global-anzu-mode))

;; Redefine M-< and M-> for some modes
(use-package beginend
  :ensure t
  :hook (after-init . beginend-global-mode))

;; Increase selected region by semantic units
(use-package expand-region
  :ensure t
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

;; Move to the beginning/end of line or code
(use-package mwim
  :ensure t
  :bind (([remap move-beginning-of-line] . mwim-beginning)
         ([remap move-end-of-line] . mwim-end)))

(use-package vundo
  :ensure t
  :bind ("C-x u" . vundo)
  :config (setq vundo-glyph-alist vundo-unicode-symbols))

;; (use-package exec-path-from-shell
;;   :ensure t
;;   :config
;;   ;; 如果你需要从 shell 继承额外的环境变量，可以在这里添加
;;   (setq exec-path-from-shell-variables '("PATH" "MANPATH" "SHELL"))
;;   (exec-path-from-shell-initialize))

(use-package whole-line-or-region
  :ensure t
  :config
  (whole-line-or-region-global-mode 1))

(use-package symbol-overlay
  :ensure t
  :bind (("M-i" . symbol-overlay-put)
         ("M-n" . symbol-overlay-switch-forward)
         ("M-p" . symbol-overlay-switch-backward)
         ("<f7>" . symbol-overlay-mode)
         ("<f8>" . symbol-overlay-remove-all))
  :config
  ;; 在需要的模式下启用 symbol-overlay-mode
  (add-hook 'prog-mode-hook 'symbol-overlay-mode)
  (add-hook 'html-mode-hook 'symbol-overlay-mode)
  (add-hook 'css-mode-hook 'symbol-overlay-mode))

(use-package display-line-numbers
  :ensure nil
  :hook ((prog-mode yaml-mode conf-mode) . display-line-numbers-mode)
  :init (setq display-line-numbers-width-start t))



(provide 'init-edit)
;;; end of init-edit.el
