(defvar use-mirror t
  "Flag to indicate whether to use the mirror prefix.")

(defun add-mirror-prefix (url)
  "Add mirror prefix to GitHub URLs if `use-mirror` is non-nil."
  (if (and use-mirror (string-match "^https://github\\.com" url))
      (concat "https://gh-proxy.com/" url)
    url))

(defun update-package-vc-urls (packages)
  "Update the URLs in PACKAGE-VC-SELECTED-PACKAGES to use the mirror prefix."
  (mapcar (lambda (pkg)
            (let ((name (car pkg))
                  (props (cdr pkg)))
              (plist-put props :url (add-mirror-prefix (plist-get props :url)))
              (cons name props)))
          packages))

;; Example usage:
(setq use-mirror t)  ;; Set this to nil if you don't want to use the mirror

;; 更新 package-vc-selected-packages 变量
(setq package-vc-selected-packages
      (update-package-vc-urls
       '(
	 (company-mode :url "https://github.com/company-mode/company-mode"
                       :vc-backend Git)
	 ;(vertico :url "https://github.com/minad/vertico"
                  ;:vc-backend Git)
         )))
;; 安装更新后的包
(package-vc-install-selected-packages)
(provide 'init-packages)
