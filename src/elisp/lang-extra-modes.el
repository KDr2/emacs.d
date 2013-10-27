;;;lang-extra-modes.el --- Extra Lang Modes Settings

;; Copyright (C) 2010-2013 KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;



(defmacro if-lang-extra (feature &rest body)
  `(if (memq ,feature (vars-get 'lang-extra-modes))
       (progn ,@body)))

;; R/ESS Settings
(if-lang-extra
 'ess
 (add-to-list 'load-path "~/.emacs.d/3rdparties/ess/lisp")
 (require 'ess-site)
 (add-to-list 'auto-mode-alist '("\\.[Rr]\\'" . R-mode)))

;; auctex mode
(if-lang-extra
 'auctex
 (add-to-list 'load-path
              "~/.emacs.d/3rdparties/auctex")
 (add-to-list 'load-path
              "~/.emacs.d/3rdparties/auctex/preview")
 (load "auctex.el" nil t t)
 (load "preview-latex.el" nil t t))

;; Perl and PDE Mode Settings
(if-lang-extra
 'pde
 (add-to-list 'load-path "~/.emacs.d/3rdparties/emacs-pde/lisp")
 (load "pde-load")
 ;;PDE的分号换行，取消之
 (defun orignal-semicolon ()
   (interactive)
   (insert ";"))
 (add-hook 'cperl-mode-hook
           '(lambda ()
              (local-set-key ";" 'orignal-semicolon))))

;; Ruby Mode Settings

(if-lang-extra
 'ruby
 (add-to-list 'load-path "~/.emacs.d/3rdparties/ruby-mode")
 (require 'ruby-mode)
 ;;(require 'ruby-electric)
 (add-to-list 'auto-mode-alist '("\\.rbw?\\'" . ruby-mode))
 (add-to-list 'auto-mode-alist '("\\.rjs\\'" . ruby-mode))
 (add-to-list 'auto-mode-alist '("\\.rhtml?\\'" . html-mode))
 ;;(add-hook 'ruby-mode-hook
 ;;          (lambda()
 ;;            (ruby-electric-mode nil)))
 )

;; (O)Caml Settings
(if-lang-extra
 'ocaml
 (add-to-list 'load-path "~/.emacs.d/3rdparties/tuareg")
 (add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
 (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
 (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
 (dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
   (add-to-list 'completion-ignored-extensions ext)))

;; Go Settings
(if-lang-extra
 'go
 (add-to-list 'load-path (concat (vars-get 'go-src-path) "/misc/emacs") t)
 (require 'go-mode-load)
 (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode)))

;; PHP Mode Settings
(if-lang-extra
 'php
 (require 'php-mode)
 (add-to-list 'auto-mode-alist '("\\.(php|inc).?\\'" . php-mode)))
