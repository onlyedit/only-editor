;;; init-terminal.el
;;; Code:
(use-package vterm
  :straight (vterm :type git :host github :repo "akermu/emacs-libvterm")
  :bind (("C-c t" . vterm)) ;; 绑定 C-c t 快捷键启动 vterm
  :config
  ;; 配置其他选项
  (setq vterm-max-scrollback 10000))

;; 安装并配置 emacs-eat，并绑定快捷键
(use-package eat
  :straight (eat :type git :host codeberg :repo "akib/emacs-eat"
                 :files ("*.el" ("term" "term/*.el") "*.texi"
                         "*.ti" ("terminfo/e" "terminfo/e/*")
                         ("terminfo/65" "terminfo/65/*")
                         ("integration" "integration/*")
                         (:exclude ".dir-locals.el" "*-tests.el")))
  :bind (("C-c e" . eat)) ;; 绑定 C-c e 快捷键启动 eat
  :config
  ;; 配置其他选项
  ;; 配置使用 zsh 作为默认 shell
  (setq eat-term-shell-command "/usr/bin/zsh")
  (setq eat-term-scrollback-size 10000))

(provide 'init-terminal)

;;; end of init-terminal.el
