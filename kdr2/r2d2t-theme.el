;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my color-theme for emacs-24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftheme r2d2t
  "Theme for KDr2 [use under terminal]")

(custom-theme-set-variables
 'r2d2t
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|\\.o$")
 '(ibuffer-formats (quote ((mark modified read-only " " (name 32 -1) " " (size 6 -1 :right) " " (mode 20 16 :right) " " filename) (mark " " (name 32 -1) " " filename))))
 '(line-spacing 0)
 '(ruby-indent-tabs-mode t)
 '(safe-local-variable-values (quote ((folded-file . t) (encoding . utf-8))))
 '(template-default-alist nil)
 '(template-directory-list nil)
 '(template-header-regexp nil)
 '(template-query nil)
 '(term-default-bg-color "#11293b")
 '(term-default-fg-color "#f5deb3")
 '(vline-global-mode nil)
 '(uniquify-buffer-name-style (quote post-forward)))

(custom-theme-set-faces
 'r2d2t
 ;;'(highlight-symbol-face ((t (:background "#468" :foreground "#00FF00" :underline t))))
 '(highlight-current-line-face ((t (:background "white"))))
 '(vline ((t (:background "white")))))

(provide-theme 'r2d2t)


