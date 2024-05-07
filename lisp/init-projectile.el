;;; init-peojectile.el --- Save and restore editor sessions between restarts -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :init
  (setq projectile-indexing-method 'native)
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

(provide 'init-projectile)
