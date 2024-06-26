;; init-highlight.el --- Initialize highlighting configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2006-2024 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Highlighting configurations.
;;

;;; Code:

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  ;;  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  ;;  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
(load-theme  'doom-one t)
;; Mode-line
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-icon t
        doom-modeline-minor-modes t)
  :bind (:map doom-modeline-mode-map
              ("C-<f6>" . doom-modeline-hydra/body))
  ;; :pretty-hydra
  ;; ((:title (pretty-hydra-title "Mode Line" 'sucicon "nf-custom-emacs" :face 'nerd-icons-purple)
  ;; 	   :color amaranth :quit-key ("q" "C-g"))
  ;;  ("Icon"
  ;;   (("i" (setq doom-modeline-icon (not doom-modeline-icon))
  ;;     "display icons" :toggle doom-modeline-icon)
  ;;    ("u" (setq doom-modeline-unicode-fallback (not doom-modeline-unicode-fallback))
  ;;     "unicode fallback" :toggle doom-modeline-unicode-fallback)
  ;;    ("m" (setq doom-modeline-major-mode-icon (not doom-modeline-major-mode-icon))
  ;;     "major mode" :toggle doom-modeline-major-mode-icon)
  ;;    ("c" (setq doom-modeline-major-mode-color-icon (not doom-modeline-major-mode-color-icon))
  ;;     "colorful major mode" :toggle doom-modeline-major-mode-color-icon)
  ;;    ("s" (setq doom-modeline-buffer-state-icon (not doom-modeline-buffer-state-icon))
  ;;     "buffer state" :toggle doom-modeline-buffer-state-icon)
  ;;    ("o" (setq doom-modeline-buffer-modification-icon (not doom-modeline-buffer-modification-icon))
  ;;     "modification" :toggle doom-modeline-buffer-modification-icon)
  ;;    ("x" (setq doom-modeline-time-icon (not doom-modeline-time-icon))
  ;;     "time" :toggle doom-modeline-time-icon)
  ;;    ("v" (setq doom-modeline-modal-icon (not doom-modeline-modal-icon))
  ;;     "modal" :toggle doom-modeline-modal-icon))
  ;;   "Segment"
  ;;   (("g h" (setq doom-modeline-hud (not doom-modeline-hud))
  ;;     "hud" :toggle doom-modeline-hud)
  ;;    ("g m" (setq doom-modeline-minor-modes (not doom-modeline-minor-modes))
  ;;     "minor modes" :toggle doom-modeline-minor-modes)
  ;;    ("g w" (setq doom-modeline-enable-word-count (not doom-modeline-enable-word-count))
  ;;     "word count" :toggle doom-modeline-enable-word-count)
  ;;    ("g e" (setq doom-modeline-buffer-encoding (not doom-modeline-buffer-encoding))
  ;;     "encoding" :toggle doom-modeline-buffer-encoding)
  ;;    ("g i" (setq doom-modeline-indent-info (not doom-modeline-indent-info))
  ;;     "indent" :toggle doom-modeline-indent-info)
  ;;    ("g c" (setq doom-modeline-display-misc-in-all-mode-lines (not doom-modeline-display-misc-in-all-mode-lines))
  ;;     "misc info" :toggle doom-modeline-display-misc-in-all-mode-lines)
  ;;    ("g l" (setq doom-modeline-lsp (not doom-modeline-lsp))
  ;;     "lsp" :toggle doom-modeline-lsp)
  ;;    ("g k" (setq doom-modeline-workspace-name (not doom-modeline-workspace-name))
  ;;     "workspace" :toggle doom-modeline-workspace-name)
  ;;    ("g g" (setq doom-modeline-github (not doom-modeline-github))
  ;;     "github" :toggle doom-modeline-github)
  ;;    ("g n" (setq doom-modeline-gnus (not doom-modeline-gnus))
  ;;     "gnus" :toggle doom-modeline-gnus)
  ;;    ("g u" (setq doom-modeline-mu4e (not doom-modeline-mu4e))
  ;;     "mu4e" :toggle doom-modeline-mu4e)
  ;;    ("g r" (setq doom-modeline-irc (not doom-modeline-irc))
  ;;     "irc" :toggle doom-modeline-irc)
  ;;    ("g f" (setq doom-modeline-irc-buffers (not doom-modeline-irc-buffers))
  ;;     "irc buffers" :toggle doom-modeline-irc-buffers)
  ;;    ("g s" (progn
  ;; 	      (setq doom-modeline-check-simple-format (not doom-modeline-check-simple-format))
  ;; 	      (and (bound-and-true-p flycheck-mode) (flycheck-buffer)))
  ;;     "simple check format" :toggle doom-modeline-check-simple-format)
  ;;    ("g t" (setq doom-modeline-time (not doom-modeline-time))
  ;;     "time" :toggle doom-modeline-time)
  ;;    ("g v" (setq doom-modeline-env-version (not doom-modeline-env-version))
  ;;     "version" :toggle doom-modeline-env-version))
  ;;   "Style"
  ;;   (("a" (setq doom-modeline-buffer-file-name-style 'auto)
  ;;     "auto"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'auto))
  ;;    ("b" (setq doom-modeline-buffer-file-name-style 'buffer-name)
  ;;     "buffer name"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'buffer-name))
  ;;    ("f" (setq doom-modeline-buffer-file-name-style 'file-name)
  ;;     "file name"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'file-name))
  ;;    ("F" (setq doom-modeline-buffer-file-name-style 'file-name-with-project)
  ;;     "file name with project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'file-name-with-project))
  ;;    ("t u" (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
  ;;     "truncate upto project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-upto-project))
  ;;    ("t f" (setq doom-modeline-buffer-file-name-style 'truncate-from-project)
  ;;     "truncate from project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-from-project))
  ;;    ("t w" (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
  ;;     "truncate with project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-with-project))
  ;;    ("t e" (setq doom-modeline-buffer-file-name-style 'truncate-except-project)
  ;;     "truncate except project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-except-project))
  ;;    ("t r" (setq doom-modeline-buffer-file-name-style 'truncate-upto-root)
  ;;     "truncate upto root"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-upto-root))
  ;;    ("t a" (setq doom-modeline-buffer-file-name-style 'truncate-all)
  ;;     "truncate all"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-all))
  ;;    ("t n" (setq doom-modeline-buffer-file-name-style 'truncate-nil)
  ;;     "truncate none"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'truncate-nil))
  ;;    ("r f" (setq doom-modeline-buffer-file-name-style 'relative-from-project)
  ;;     "relative from project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'relative-from-project))
  ;;    ("r t" (setq doom-modeline-buffer-file-name-style 'relative-to-project)
  ;;     "relative to project"
  ;;     :toggle (eq doom-modeline-buffer-file-name-style 'relative-to-project)))
  ;;   "Project Detection"
  ;;   (("p a" (setq doom-modeline-project-detection 'auto)
  ;;     "auto"
  ;;     :toggle (eq doom-modeline-project-detection 'auto))
  ;;    ("p f" (setq doom-modeline-project-detection 'ffip)
  ;;     "ffip"
  ;;     :toggle (eq doom-modeline-project-detection 'ffip))
  ;;    ("p i" (setq doom-modeline-project-detection 'projectile)
  ;;     "projectile"
  ;;     :toggle (eq doom-modeline-project-detection 'projectile))
  ;;    ("p p" (setq doom-modeline-project-detection 'project)
  ;;     "project"
  ;;     :toggle (eq doom-modeline-project-detection 'project))
  ;;    ("p n" (setq doom-modeline-project-detection nil)
  ;;     "disable"
  ;;     :toggle (eq doom-modeline-project-detection nil)))
  ;;   "Misc"
  ;;   (("n" (progn
  ;;           (message "Fetching GitHub notifications...")
  ;;           (run-with-timer 300 nil #'doom-modeline--github-fetch-notifications)
  ;;           (browse-url "https://github.com/notifications"))
  ;;     "github notifications" :exit t)
  ;;    ("e" (cond ((bound-and-true-p flycheck-mode)
  ;;                (flycheck-list-errors))
  ;;               ((bound-and-true-p flymake-mode)
  ;;                (flymake-show-diagnostics-buffer)))
  ;;     "list errors" :exit t)
  ;;    ("w" (if (bound-and-true-p grip-mode)
  ;; 	      (grip-browse-preview)
  ;;           (message "Not in preview"))
  ;;     "browse preview" :exit t)
  ;;    ("z h" (set-from-minibuffer 'doom-modeline-height)
  ;;     "set height" :exit t)
  ;;    ("z w" (set-from-minibuffer 'doom-modeline-bar-width)
  ;;     "set bar width" :exit t)
  ;;    ("z g" (set-from-minibuffer 'doom-modeline-github-interval)
  ;;     "set github interval" :exit t)
  ;;    ("z n" (set-from-minibuffer 'doom-modeline-gnus-timer)
  ;;     "set gnus interval" :exit t))))
  )

(use-package hide-mode-line
  :hook (((treemacs-mode
           eshell-mode shell-mode
           term-mode vterm-mode
           embark-collect-mode
           lsp-ui-imenu-mode
           pdf-annot-list-mode) . turn-on-hide-mode-line-mode)
         (dired-mode . (lambda()
                         (and (bound-and-true-p hide-mode-line-mode)
                              (turn-off-hide-mode-line-mode))))))

;; A minor-mode menu for mode-line
(use-package minions
  :hook (doom-modeline-mode . minions-mode))

;; Font
(defun font-installed-p (font-name)
  "Check if font with FONT-NAME is available."
  (find-font (font-spec :name font-name)))
;; Icons
(use-package nerd-icons
  :config
  (when (and (display-graphic-p)
             (not (font-installed-p nerd-icons-font-family)))
    (nerd-icons-install-fonts t)))

;; Show line numbers
(use-package display-line-numbers
  :ensure nil
  :hook ((prog-mode yaml-mode conf-mode) . display-line-numbers-mode)
  :init (setq display-line-numbers-width-start t))

;; Suppress GUI features
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-scratch-message nil)
(unless (daemonp)
  (advice-add #'display-startup-echo-area-message :override #'ignore))

;; Display dividers between windows
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(add-hook 'window-setup-hook #'window-divider-mode)

;; Easily adjust the font size in all frames
(use-package default-text-scale
  :hook (after-init . default-text-scale-mode)
  :bind (:map default-text-scale-mode-map
              ("s-="   . default-text-scale-increase)
              ("s--"   . default-text-scale-decrease)
              ("s-0"   . default-text-scale-reset)
              ("C-s-=" . default-text-scale-increase)
              ("C-s--" . default-text-scale-decrease)
              ("C-s-0" . default-text-scale-reset)))

;; Display time
(use-package time
  :init (setq display-time-default-load-average nil
              display-time-format "%H:%M"))

;; Mouse & Smooth Scroll
;; Scroll one line at a time (less "jumpy" than defaults)
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . hscroll))
        mouse-wheel-scroll-amount-horizontal 1
        mouse-wheel-progressive-speed nil))
(setq scroll-step 1
      scroll-margin 0
      scroll-conservatively 100000
      auto-window-vscroll nil
      scroll-preserve-screen-position t)

(provide 'init-ui)
;;; end of init-ui.el
