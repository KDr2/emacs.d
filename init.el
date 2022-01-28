;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'cl)

(setq debug-on-error t)

;; load early-init.el if emacs is prior to v27
(when (or noninteractive (version< emacs-version "27"))
  (load (concat user-emacs-directory "early-init.el")))

;; load-path settings
(defvar non-elpa-load-path
  (concat user-emacs-directory "non-elpa")
  "packages not on elpa")

(defun add-non-elpa-load-path (path)
  (add-to-list 'load-path (concat non-elpa-load-path path)))

(add-to-list 'load-path non-elpa-load-path)
(add-to-list 'load-path (concat user-emacs-directory "src/elisp"))

(if (or noninteractive (version< emacs-version "27"))
    (package-initialize))

;; load KDr2's settings
(require 'init-main)

;;
;;
;;
;;-----------------------------------------------------------
;; ----------- end of KDr2's customized confif --------------
;;-----------------------------------------------------------
;;
;;
;;
