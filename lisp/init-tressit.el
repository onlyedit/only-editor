;;; Code
(use-package treesit-auto
  :straight (treesit-auto :type git :host github :repo "renzmann/treesit-auto")
  :config
  (global-treesit-auto-mode))

(setq treesit-font-lock-level 4)
(provide 'init-tressit)
