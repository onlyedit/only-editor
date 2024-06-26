;;; init-batter-default.el -- emacs config
;;; Commery

;;在文件最开头添加地个 文件作用域的变量设置，设置变量的绑定方式
;; -*- lexical-binding: t -*-

(when (display-graphic-p)
(tool-bar-mode -1)
(scroll-bar-mode -1))
(icomplete-mode 1)
(setq-default cursor-type 'bar)
(show-paren-mode t)
(global-auto-revert-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-batter-default)
