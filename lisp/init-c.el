;;; init-c.el --- c/cpp language config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun tab-c-mode-hook ()
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t))

(use-package google-c-style
  :straight t
  :hook
  (c-mode-common-hook . google-set-c-style)
  (c-mode-common-hook . google-make-newline-indent))

(use-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode))

(add-hook 'c-mode-hook 'tab-c-mode-hook)
(add-hook 'c++-mode-hook 'tab-c-mode-hook)

(provide 'init-c)
