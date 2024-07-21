;;; init-ui.el --- initialize theme, mode line,
;;; Code:

(use-package dracula-theme
  :straight (dracula-theme :type git :host github :repo "dracula/emacs")
  :config
  (load-theme 'dracula t))

(use-package nerd-icons
  :straight (nerd-icons :type git :host github :repo "rainstormstudio/nerd-icons.el"))

;; 安装并配置 nerd-icons-dired
(use-package nerd-icons-dired
  :straight (nerd-icons-dired :type git :host github :repo "rainstormstudio/nerd-icons-dired")
  :after (nerd-icons dired)
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-corfu
  :straight (nerd-icons-corfu :type git :host github :repo "LuigiPiucco/nerd-icons-corfu")
  :after (nerd-icons corfu)
  :config
  ;; 添加到 corfu-margin-formatters
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package doom-modeline
  :straight (doom-modeline :type git :host github :repo "seagle0128/doom-modeline")
  :init (doom-modeline-mode 1))

(provide 'init-ui)
;;; end of init-ui.el
