
;;; init-better-default.el -- emacs config
;;; Commery

;;在文件最开头添加地个 文件作用域的变量设置，设置变量的绑定方式
;; -*- lexical-binding: t -*-

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(icomplete-mode 1)
;;(setq-default cursor-type 'bar)
(show-paren-mode t)
(global-auto-revert-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(pixel-scroll-precision-mode t)
(electric-pair-mode 1)
;; 只在终端环境生效
(unless (display-graphic-p)
  (setq visible-cursor nil))

(setq my-long-line-face (make-face 'my-long-line-face))
(set-face-foreground 'my-long-line-face "red")
(set-face-background 'my-long-line-face "grey3")
(set-face-attribute 'my-long-line-face nil :box"green")

(defun c-mode-add-keywords (mode)
  (font-lock-add-keywords
   mode
   '(("\t+" (0 'my-tab-face append))
     ("^.\\{79\\}\\(.+\\)$" (1 'my-long-line-face append)))))

(global-set-key (kbd "<escape>") 'save-buffer)

(provide 'init-better-default)
;;; end of init-better-default.el
