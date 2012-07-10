;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my color-theme for emacs-24
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftheme r2d2
  "Theme for KDr2")

(custom-theme-set-variables
 'r2d2
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
 'r2d2
 '(default ((t (:background "#101e2e" :foreground "wheat3"))))
 '(bold ((t (:foreground "#61CE3C" :weight bold))))
 '(border ((t nil)))
 '(cursor ((t (:background "khaki" :foreground "#b7282e"))))
 '(mouse ((t (:foreground "khaki" :background "black"))))
 '(fringe ((t (:background "#555753"))))
 '(region ((t (:background "#0d4519"))))
 '(font-lock-builtin-face ((t (:foreground "#729fcf"))))
 '(font-lock-comment-face ((t (:foreground "#888a85"))))
 '(font-lock-function-name-face ((t (:foreground "#edd400"))))
 '(font-lock-keyword-face ((t (:foreground "#729fcf"))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8"))))
 '(font-lock-type-face ((t (:foreground "#8ae234"))))
 '(font-lock-variable-name-face ((t (:foreground "#b66d6d"))))
 '(minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
 '(font-lock-warning-face ((t (:foreground "Red" :bold t))))
 '(mode-line ((t (:foreground "Black" :background "#752"))))
 '(mode-line-inactive ((t (:foreground "Black" :background "Gray75"))))
 '(modeline-buffer-id ((t (:background "Gray75" :foreground "blue4"))))
 '(modeline-mousable ((t (:background "Gray75" :foreground "firebrick"))))
 '(modeline-mousable-minor-mode ((t (:background "Gray75" :foreground "green4"))))
 ;;misc-modes:
 '(highlight-symbol-face ((t (:background "#468" :foreground "#00FF00" :underline t))))
 '(highlight-current-line-face ((t (:background "#468"))))
 '(vline ((t (:background "#468"))))
 ;;IDO
 '(ido-only-match ((t (:foreground "green4"))))
 '(ido-subdir ((t (:foreground "yellow"))))
 '(ido-first-match ((t (:foreground "green"))))
 '(custom-variable-tag ((t (:foreground "yellow" :bold t))))
 ;;rst
 '(rst-level-1-face ((t (:background "#101e2e" :foreground "#d7003a" :bold t))))
 '(rst-level-2-face ((t (:background "#101e2e" :foreground "#b94047" :bold t))))
 '(rst-level-3-face ((t (:background "#101e2e" :foreground "#a86965" :bold t))))
 '(rst-level-4-face ((t (:background "#101e2e" :foreground "#006e54" :bold t))))
 '(rst-level-5-face ((t (:background "#101e2e" :foreground "#00a381" :bold t))))
 '(rst-level-6-face ((t (:background "#101e2e" :foreground "#6e7955" :bold t))))
 ;;git-emacs
 '(git--mark-blob-face ((t (:foreground "#6e79f0" :bold t))))
 '(git--unknown-face ((t (:foreground "#6e7955" :bold t)))))

(provide-theme 'r2d2)


