;;; init-projectil.el
;;; Code

(use-package project
  :straight t)

;; 安装并配置 projectile
(use-package projectile
  :straight (projectile :type git :host github :repo "bbatsov/projectile")
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map))
  :config
  (setq projectile-generic-command "rg --files --hidden -0"))
;; 安装并配置 rg.el
(use-package rg
  :straight (rg :type git :host github :repo "dajva/rg.el")
  :after projectile
  :config
  (rg-enable-default-bindings))

(provide 'init-projectile)
;;; end of init-projectile.el
