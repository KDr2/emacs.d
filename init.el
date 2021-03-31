;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(setq debug-on-error t)

;; load-path settings
(defvar non-elpa-load-path
  (concat user-emacs-directory "non-elpa")
  "packages not on elpa")

(defun add-non-elpa-load-path (path)
  (add-to-list 'load-path (concat non-elpa-load-path path)))

(add-to-list 'load-path non-elpa-load-path)
(add-to-list 'load-path (concat user-emacs-directory "src/elisp"))

(if (string< emacs-version "27")
    (package-initialize))

;; load kdr2's settings
(require 'init-main)
