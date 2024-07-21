;;; init-paredit.el --- Configure paredit structured editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Automatic parenthesis pairing
;; (use-package elec-pair
;;   :hook (after-init . electric-pair-mode)
;;   :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))

(use-package diminish
  :straight t)
;; 配置 paredit
(use-package paredit
  :straight t
  :hook ((emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode) . paredit-mode)
  :init
  (defun sanityinc/maybe-map-paredit-newline ()
    (unless (or (derived-mode-p 'inferior-emacs-lisp-mode 'cider-repl-mode)
                (minibufferp))
      (local-set-key (kbd "RET") 'paredit-newline)))
  (add-hook 'paredit-mode-hook 'sanityinc/maybe-map-paredit-newline)
  (defun sanityinc/conditionally-enable-paredit-mode ()
    "Enable paredit during lisp-related minibuffer commands."
    (when (memq this-command paredit-minibuffer-commands)
      (enable-paredit-mode)))
  (defvar paredit-minibuffer-commands '(eval-expression
                                        pp-eval-expression
                                        eval-expression-with-eldoc
                                        ibuffer-do-eval
                                        ibuffer-do-view-and-eval)
    "Interactive commands for which paredit should be enabled in the minibuffer.")
  (add-hook 'minibuffer-setup-hook 'sanityinc/conditionally-enable-paredit-mode)
  (add-hook 'sanityinc/lispy-modes-hook 'enable-paredit-mode)
  :config
  (diminish 'paredit-mode " Par")
  ;; Suppress certain paredit keybindings to avoid clashes
  (dolist (binding '("RET" "C-<left>" "C-<right>" "C-M-<left>" "C-M-<right>" "M-s" "M-?"))
    (define-key paredit-mode-map (read-kbd-macro binding) nil))
  (define-key paredit-mode-map (kbd "M-<up>") 'paredit-splice-sexp-killing-backward))

;; 配置 puni
(use-package puni
  :straight (puni :type git :host github :repo "AmaiKinono/puni")
  :hook ((sanityinc/lispy-modes-hook . (lambda () (puni-mode -1))))
  :config
  (define-key puni-mode-map (kbd "M-(") 'puni-wrap-round)
  (define-key puni-mode-map (kbd "C-(") 'puni-slurp-backward)
  (define-key puni-mode-map (kbd "C-)") 'puni-slurp-forward)
  (define-key puni-mode-map (kbd "C-}") 'puni-barf-forward)
  (define-key puni-mode-map (kbd "C-{") 'puni-barf-backward)
  (define-key puni-mode-map (kbd "M-<up>") 'puni-splice-killing-backward)
  (define-key puni-mode-map (kbd "C-w") nil))

(provide 'init-paredit)
