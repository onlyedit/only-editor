;;; init-c.el --- c/cpp language config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; google style, but with 4 space indent.

(setq c-default-style "linux"
      c-basic-offset 4
      tab-width 4
      indent-tabs-mode nil)


(use-package google-c-style
  :ensure t
  :hook
  (c-mode-common-hook . google-set-c-style)
  (c-mode-common-hook . google-make-newline-indent))
(provide 'init-c)
