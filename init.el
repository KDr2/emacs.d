;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;append  load-path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/3rdparties")
(add-to-list 'load-path "~/.emacs.d/kdr2")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;=======kdr2-ext-settings===
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/kdr2/main.el")

;;custom-settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "eea8e2f6e38400fe57a3ad7190f1a31c797398b3")
 '(default-input-method "eim-py")
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|\\.o$")
 '(ibuffer-formats (quote ((mark modified read-only " " (name 32 -1) " " (size 6 -1 :right) " " (mode 20 16 :right) " " filename) (mark " " (name 32 -1) " " filename))))
 '(line-spacing 0)
 '(pde-load-path "~/.emacs.d/3rdparties/pde/")
 '(pde-perl-version "5.10.0")
 '(ruby-indent-tabs-mode t)
 '(safe-local-variable-values (quote ((folded-file . t) (encoding . utf-8))))
 '(template-default-alist nil)
 '(template-directory-list nil)
 '(template-header-regexp nil)
 '(template-query nil)
 '(term-default-bg-color "#11293b")
 '(term-default-fg-color "#f5deb3")
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(vline-global-mode nil))

(put 'upcase-region 'disabled nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:foreground "#61CE3C" :weight bold))))
 '(highlight-symbol-face ((t (:background "#468" :foreground "#00FF00" :underline t)))))
