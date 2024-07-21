;;; init-magit.el -- config git
;;; Code:

;; 安装并配置 magit，并绑定快捷键
;; (use-package magit
;;   :straight (magit :type git :host github :repo "magit/magit")
;;   :bind (("C-x g" . magit-status) ;; 绑定 C-x g 快捷键打开 magit 状态缓冲区
;;          ("C-x M-g" . magit-dispatch)))
;; 绑定 C-x M-g 快捷键打开 magit 命令调度

(use-package magit
  :straight t)
(provide 'init-magit)
;;; end of init-magit.el
