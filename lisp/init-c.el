;;; init-c.el --- c/cpp language config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:b


(setq c-default-style "linux"
      c-basic-offset 4)
(use-package google-c-style
  :ensure t
  :hook
  (c-mode-common-hook . google-set-c-style)
  (c-mode-common-hook . google-make-newline-indent))

(use-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode))

(provide 'init-c)
