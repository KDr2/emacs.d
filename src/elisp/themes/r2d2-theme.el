;;; r2d2-theme.el --- Theme R2D2

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(deftheme r2d2
  "Theme for KDr2")

(custom-theme-set-variables
 'r2d2
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|\\.o$")
 '(ibuffer-formats
   (quote
    ((mark modified read-only " " (name 32 -1) " " (size 6 -1 :right) " " (mode 20 16 :right) " " filename)
     (mark " " (name 32 -1) " " filename))))
 '(line-spacing 0)
 '(linum-format "%4d ")
 '(ruby-indent-tabs-mode t)
 '(safe-local-variable-values (quote ((folded-file . t) (encoding . utf-8))))
 '(template-default-alist nil)
 '(template-directory-list nil)
 '(template-header-regexp nil)
 '(template-query nil)
 '(term-default-bg-color "#00282E")
 '(term-default-fg-color "#wheat3")
 '(vline-global-mode nil)
 '(uniquify-buffer-name-style (quote post-forward))
 '(gdb-many-windows t)
 '(gdb-use-separate-io-buffer nil))

(custom-theme-set-faces
 'r2d2
 '(default ((t (:background "#00282E" :foreground "wheat3"))))
 '(bold ((t (:foreground "#61CE3C" :weight bold))))
 '(border ((t nil)))
 '(cursor ((t (:background "khaki" :foreground "#b7282e"))))
 '(mouse ((t (:foreground "khaki" :background "black"))))
 '(fringe ((t (:background "SteelBlue4"))))
 '(region ((t (:background "SteelBlue4"))))
 '(trailing-whitespace ((t (:background "SteelBlue4"))))
 '(font-lock-builtin-face ((t (:foreground "#729fcf"))))
 '(font-lock-comment-face ((t (:foreground "azure4"))))
 '(font-lock-function-name-face ((t (:foreground "#edd400"))))
 '(font-lock-keyword-face ((t (:foreground "#729fcf"))))
 '(font-lock-string-face ((t (:foreground "#ad7fa8"))))
 '(font-lock-type-face ((t (:foreground "#8ae234"))))
 '(font-lock-variable-name-face ((t (:foreground "#b66d6d"))))
 '(minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
 '(font-lock-warning-face ((t (:foreground "Red" :bold t))))
 '(mode-line ((t (:foreground "Black" :background "DarkOliveGreen"))))
 '(mode-line-inactive ((t (:foreground "Black" :background "#829496"))))
 '(modeline-buffer-id ((t (:background "Gray75" :foreground "blue4"))))
 '(modeline-mousable ((t (:background "Gray75" :foreground "firebrick"))))
 '(modeline-mousable-minor-mode ((t (:background "Gray75" :foreground "green4"))))
 ;;misc-modes:
 '(highlight-symbol-face ((t (:background "#068" :foreground "#0FFFF0" :underline t))))
 '(hl-line ((t (:background "#11392E"))))
 '(vline ((t (:background "#11392E"))))
 ;;linum
 '(linum ((t (:foreground "yellow"))));; :family "courier new"
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
