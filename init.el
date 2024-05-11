;;; init.el -- emacs config
;;; Commery

;;在文件最开头添加地个 文件作用域的变量设置，设置变量的绑定方式
;; -*- lexical-binding: t -*-

(setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;; fixed compat version not avaliable
(setq package-check-signature nil)

(setq user-home-directory "/home/joe.zhao/")
;;(setq package-archives
;;      `(("melpa" . ,(concat user-home-directory ".elpa-mirror/melpa/"))
;;        ("org"   . ,(concat user-home-directory ".elpa-mirror/org/"))
;;	("nongnu"   . ,(concat user-home-directory ".elpa-mirror/nongnu/"))
;;        ("gnu"   . ,(concat user-home-directory ".elpa-mirror/gnu/"))))

(package-initialize)
;; Should set before loading `use-package'
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-expand-minimally t
      use-package-enable-imenu-support t)

;; Required by `use-package'
(use-package diminish :ensure t)
;;防止反复调用 package-refresh-contents 会影响加载速度
(when (not package-archive-contents)
  (package-refresh-contents))

;; open init file f2
;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'init-batter-default)

(require 'init-recentf)
(require 'init-minibuffer)
(require 'init-hippie-expand)
(require 'init-corfu)
(require 'init-windows)
(require 'init-sessions)
;;(require 'init-mmm)
(require 'init-paredit)
(require 'init-edit)
;;(require 'init-evil)
(require 'init-highlight)
(require 'init-projectile)
(require 'init-eglot)
(require 'init-snippet)
;;program languages
(require 'init-c)

;; others 
(require 'init-ui)
(require 'init-dashboard)
(require 'init-which-key)
;;; end of init.el
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(consult-eglot default-text-scale vundo vertico undo-tree symbol-overlay switch-window smart-region session rainbow-mode rainbow-delimiters projectile orderless mwim minions marginalia iedit ialign hungry-delete hl-todo highlight-indent-guides hide-mode-line goto-chg google-c-style goggles embark-consult drag-stuff doom-themes doom-modeline diminish diff-hl corfu beginend anzu aggressive-indent))
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
