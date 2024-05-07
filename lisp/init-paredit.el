;;; init-paredit.el --- Configure paredit structured editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Automatic parenthesis pairing
(use-package elec-pair
  :ensure nil
  :hook (after-init . electric-pair-mode)
  :init (setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit))

(provide 'init-paredit)
