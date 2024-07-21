;;; init-embark.el -- emacs config
;;; Commery
 
;;在文件最开头添加地个 文件作用域的变量设置，设置变量的绑定方式
;; -*- lexical-binding: t -*-
;;; Code:
;; Example configuration for vertico
;; 安装并配置 embark
(use-package embark
  :straight (embark :type git :host github :repo "oantolin/embark")
  :bind
  (("C-]" . embark-act)         ;; 绑定 embark-act 到 C-]
   ("C-;" . embark-dwim)
   ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :straight t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))
(provide 'init-embark)
;;; end of init-embark.el
