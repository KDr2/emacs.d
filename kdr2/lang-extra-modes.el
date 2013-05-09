;; (O)Caml Settings

(add-to-list 'load-path "~/.emacs.d/3rdparties/tuareg")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(dolist (ext '(".cmo" ".cmx" ".cma" ".cmxa" ".cmi"))
  (add-to-list 'completion-ignored-extensions ext))

;; R Settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/ess/lisp")
(require 'ess-site)
(add-to-list 'auto-mode-alist '("\\.[Rr]\\'" . R-mode))

;;
(if (vars-get 'go-src-path)
    (progn
      (add-to-list 'load-path (concat (vars-get 'go-src-path) "/misc/emacs") t)
      (require 'go-mode-load)
      (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))))



;; Perl and PDE Mode Settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/emacs-pde/lisp")
(load "pde-load")
;;PDE的分号换行，取消之
(defun orignal-semicolon ()
  (interactive)
  (insert ";"))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (local-set-key ";" 'orignal-semicolon)))

;; Ruby Mode Settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/ruby-mode")
(require 'ruby-mode)
;;(require 'ruby-electric)
(add-to-list 'auto-mode-alist '("\\.rbw?\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml?\\'" . html-mode))
;;(add-hook 'ruby-mode-hook
;;          (lambda()
;;            (ruby-electric-mode nil)))

;; PHP Mode Settings
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.(php|inc).?\\'" . php-mode))

;; auctex mode
(add-to-list 'load-path
             "~/.emacs.d/3rdparties/auctex")
(add-to-list 'load-path
             "~/.emacs.d/3rdparties/auctex/preview")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
