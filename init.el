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

;; load kdr2's settings
(require 'init-main)
