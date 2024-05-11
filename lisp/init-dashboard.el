;; init-dashboard.el --- Initialize dashboard configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2018-2024 Vincent Zhang

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
;; Dashboard configurations.
;;

;;; Code:

;; Dashboard
;; use-package with package.el:

;; use-package with package.el:
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  :init
  (setq dashboard-banner-logo-title "EMACS - Enjoy Programming & Writing"
	;;dashboard-startup-banner 'official
	;;dashboard-page-separator "\n\f\n"
	dashboard-projects-backend 'projectile
	;;dashboard-path-style 'truncate-middle
	dashboard-path-max-length 60
	;;dashboard-center-content t
	;;dashboard-vertically-center-content t
	;;dashboard-show-shortcuts nil
	dashboard-items '((recents  . 10)
			  (bookmarks . 5)
			  (projects . 5))))
  

;; (use-package dashboard
;;   :diminish dashboard-mode
;;   :custom-face
;;   (dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
;;   (dashboard-items-face ((t (:weight normal))))
;;   (dashboard-no-items-face ((t (:weight normal))))
;;   :bind (("<f5>" . open-dashboard))
;;   :hook (dashboard-mode . (lambda ()
;;          ;; No title
;;          (setq-local frame-title-format nil)
;;          ;; Enable `page-break-lines-mode'
;;          (when (fboundp 'page-break-lines-mode)
;;            (page-break-lines-mode 1))))
;;   :init
;;   (setq dashboard-banner-logo-title "CENTAUR EMACS - Enjoy Programming & Writing"
;;    dashboard-startup-banner 'official
;;   dashboard-page-separator "\n\f\n"
;;   dashboard-projects-backend 'projectile
;;   dashboard-path-style 'truncate-middle
;;   dashboard-path-max-length 60
;;   dashboard-center-content t
;;   dashboard-vertically-center-content t
;;   dashboard-show-shortcuts nil
;;   dashboard-items '((recents  . 10)
;;    (bookmarks . 5)
;;    (projects . 5))

;;   dashboard-startupify-list '(dashboard-insert-banner
;;    dashboard-insert-newline
;;    dashboard-insert-banner-title
;;    dashboard-insert-newline
;;    dashboard-insert-navigator
;;    dashboard-insert-newline
;;    dashboard-insert-init-info
;;    dashboard-insert-items
;;    dashboard-insert-newline
;;    dashboard-insert-footer)

;;   dashboard-display-icons-p nil
;;   ;;dashboard-set-file-icons centaur-icon
;;   ;;dashboard-set-heading-icons centaur-icon
;;   dashboard-heading-icons '((recents   . "nf-oct-history")
;;    (bookmarks . "nf-oct-bookmark")
;;    (agenda    . "nf-oct-calendar")
;;    (projects  . "nf-oct-briefcase")
;;    (registers . "nf-oct-database")))

;; (dashboard-setup-startup-hook)
;; :config
;; ;; Insert copyright
;; ;; @see https://github.com/emacs-dashboard/emacs-dashboard/issues/219
;; (defun my-dashboard-insert-copyright ()
;;   "Insert copyright in the footer."
;;   (dashboard-insert-center
;;    (propertize (format "\nPowered by Vincent Zhang, %s\n" (format-time-string "%Y"))
;;    'face 'font-lock-comment-face)))
;; (advice-add #'dashboard-insert-footer :after #'my-dashboard-insert-copyright)

;; (defun restore-session ()
;;   "Restore the previous session."
;;   (interactive)
;;   (message "Restoring previous session...")
;;   (quit-window t)
;;   (cond
;;    ((bound-and-true-p tabspaces-mode)
;;     (tabspaces-restore-session))
;;    ((bound-and-true-p desktop-save-mode)
;;     (desktop-read)))
;;   (message "Restoring previous session...done"))

;; (defun dashboard-goto-recent-files ()
;;   "Go to recent files."
;;   (interactive)
;;   (let ((func (local-key-binding "r")))
;;    (and func (funcall func))))

;; (defun dashboard-goto-projects ()
;;   "Go to projects."
;;   (interactive)
;;   (let ((func (local-key-binding "p")))
;;    (and func (funcall func))))

;; (defun dashboard-goto-bookmarks ()
;;   "Go to bookmarks."
;;   (interactive)
;;   (let ((func (local-key-binding "m")))
;;    (and func (funcall func))))

;; (defvar dashboard-recover-layout-p nil
;;   "Wether recovers the layout.")

;; (defun open-dashboard ()
;;   "Open the *dashboard* buffer and jump to the first widget."
;;   (interactive)
;;   ;; Check if need to recover layout
;;   (if (length> (window-list-1)
;;    ;; exclude `treemacs' window
;;    (if (and (fboundp 'treemacs-current-visibility)
;;     (eq (treemacs-current-visibility) 'visible))
;;    2
;;     1))
;;    (setq dashboard-recover-layout-p t))

;;   ;; Display dashboard in maximized window
;;   (delete-other-windows)

;;   ;; Refresh dashboard buffer
;;   (dashboard-refresh-buffer)

;;   ;; Jump to the first section
;;   (dashboard-goto-recent-files))

;; (defun quit-dashboard ()
;;   "Quit dashboard window."
;;   (interactive)
;;   (quit-window t)
;;   (and dashboard-recover-layout-p
;;    (and (bound-and-true-p winner-mode) (winner-undo))
;;    (setq dashboard-recover-layout-p nil))))

(provide 'init-dashboard)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dashboard.el ends here
