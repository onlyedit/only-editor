;;; init.el -- emacs config
;;; Commery
;;; Code:

;;在文件最开头添加地个 文件作用域的变量设置，设置变量的绑定方式
;; -*- lexical-binding: t -*-

;; (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                          ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
;;                          ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;; (package-initialize)
;;防止反复调用 package-refresh-contents 会影响加载速度
;;(when (not package-archive-contents)
;;  (package-refresh-contents))

;; open init file f2
;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-straight)
(require 'init-better-default)
(require 'init-consult)
(require 'init-vertico)
(require 'init-embark)
(require 'init-recentf)
(require 'init-corfu)
;;(require 'init-windows)
(require 'init-sessions)
;;(require 'init-mmm)
(require 'init-paredit)
(require 'init-edit)
(require 'init-terminal)
(require 'init-magit)
;;(require 'init-evil)
;;(require 'init-highlight)
(require 'init-projectile)
;;(require 'init-citre)
;;(require 'init-treemac)
(require 'init-eglot)
;;(require 'init-snippet)
;;program languages
(require 'init-c)
;;(require 'init-python)

;; others
(require 'init-tressit)
(require 'init-ui)
;;(require 'init-dashboard)
(require 'init-which-key)

;; 加载自定义变量文件
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror 'nomessage)

;;; end of init.el
