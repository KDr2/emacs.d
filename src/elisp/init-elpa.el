;;; init-elpa.el --- elpa settings
;;; copied from https://github.com/purcell/emacs.d/blob/master/init-elpa.el

;;; Find and load the correct package.el

;; When switching between Emacs 23 and 24, we always use the bundled package.el in Emacs 24

(let ((package-el-site-lisp-dir
       (expand-file-name "site-lisp/package" user-emacs-directory)))
  (when (and (file-directory-p package-el-site-lisp-dir)
             (> emacs-major-version 23))
    (message "Removing local package.el from load-path to avoid shadowing bundled version")
    (setq load-path (remove package-el-site-lisp-dir load-path))))

(require 'package)

;;; Add support to package.el for pre-filtering available packages

(defvar package-filter-function nil
  "Optional predicate function used to internally filter packages used by package.el.

The function is called with the arguments PACKAGE VERSION ARCHIVE, where
PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
ARCHIVE is the string name of the package archive.")

(defadvice package--add-to-archive-contents
  (around filter-packages (package archive) activate)
  "Add filtering of available packages using `package-filter-function', if non-nil."
  (when (or (null package-filter-function)
         (funcall package-filter-function
                 (car package)
                 (funcall (if (fboundp 'package-desc-version)
                                 'package--ac-desc-version
                                'package-desc-vers)
                         (cdr package))
                 archive))
    ad-do-it))

;;; Standard package repositories
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t))

;;; Non-Standard package repositories
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("popkit" . "https://elpa.popkit.org/packages/") t) ;; broken

;; But don't take Melpa versions of certain packages
(setq package-filter-function
      (lambda (package version archive)
        (or (not (string-equal archive "melpa"))
            (not (memq package '())))))



;;; On-demand installation of packages

(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;;; Fire up package.el
(if (string< emacs-version "27")
    (package-initialize))

;; for issues on some version of Emacs
;; (package-initialize) ; for the first installation
;; (setq package-check-signature nil)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; cope with bad gpg signature
(setq package-check-signature nil)
(require-package 'gnu-elpa-keyring-update)

(provide 'init-elpa)
