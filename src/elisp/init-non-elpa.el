;;; init-non-elpa.el --- xml-rpc settings for KDr2's Emacs

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; package not on elpa
;; - gas-mode.el
;; - emacs-pde
;; - pyim-dicts
;; - ansit.el
;; - find-recursive.el
;; - rotate-windows.el
;; - sdcv-mode.el

(when non-elpa-enabled
  ;; asm/gas mode
  (require 'init-as)
  ;; chinese input method
  (require 'init-pyim)
  ;; Perl and PDE Mode Settings
  (if-lang 'pde (require 'init-pde)))

(provide 'init-non-elpa)
