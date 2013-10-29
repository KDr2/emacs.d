;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

;; load-path settings
(defvar non-elpa-load-path
  (concatenate 'string user-emacs-directory "non-elpa")
  "")

(defun add-non-elpa-load-path (path)
  (add-to-list 'load-path (concatenate 'string non-elpa-load-path path)))

(add-to-list 'load-path user-emacs-directory)
(add-to-list 'load-path non-elpa-load-path)
(add-to-list 'load-path (concatenate 'string user-emacs-directory "elpa"))
(add-to-list 'load-path (concatenate 'string user-emacs-directory "src/elisp"))

;; kdr2 ext settings
(require 'init-main)

;;custom-settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "eea8e2f6e38400fe57a3ad7190f1a31c797398b3")
 '(default-input-method "eim-py")
 (list 'org-export-html-style (xhtml-css-from-file "~/.emacs.d/src/resources/org-theme-hy.css"))
 '(org-export-html-style-include-default nil)
 '(pde-load-path "~/.emacs.d/3rdparties/pde/")
 '(pde-perl-version "5.10.0"))

(put 'upcase-region 'disabled nil)
