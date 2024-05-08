;;; init-which-key.el --- c/cpp language config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package which-key
  :init
  (which-key-mode)
  :config
  (which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
	which-key-side-window-max-width 0.33
	which-key-idle-delay 0.05)
  :diminish which-key-mode)
(provide 'init-which-key)
;;; end of init-which-key.el
