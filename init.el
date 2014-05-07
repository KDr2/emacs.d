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

;; load kdr2's settings
(require 'init-main)

;; debug code, to find to enables my auto-fill-mode
(if (not noninteractive)
    (defadvice auto-fill-mode (around backtrace-fill-mode activate)
      (message "------BEFORE-------")
      (backtrace)
      ad-do-it
      (message "------AFTER--------")))
