;; init-eglot.el --- Initialize eglot configurations.	-*- lexical-binding: t -*-
;;; Commentary:
;;
;; eglot configurations.
;;

;;; Code:

(use-package eglot
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode 'lisp-mode 'makefile-mode 'snippet-mode)
                          (eglot-ensure))))
         ((markdown-mode yaml-mode yaml-ts-mode) . eglot-ensure))
  :init
  (setq read-process-output-max (* 1024 1024)) ; 1MB
  (setq eglot-autoshutdown t
        eglot-send-changes-idle-time 0.5)
  :config
  (use-package consult-eglot
    :bind (:map eglot-mode-map
		("C-M-." . consult-eglot-symbols))))

(use-package eglot-booster
  :straight (eglot-booster :type git :host githun :repo "jdtsmith/eglot-booster")
  :after eglot
  :config (eglot-booster-mode))

(provide 'init-eglot)
;;; end of init-eglot.el
