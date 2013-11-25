;;; r2d2t-theme.el --- Theme R2D2-Terminal

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(deftheme r2d2t
  "Theme for KDr2 [use under terminal]")

(custom-theme-set-variables
 'r2d2t
 '(dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\.\\|\\.o$")
 '(ibuffer-formats
   (quote
    ((mark modified read-only " " (name 32 -1) " " (size 6 -1 :right) " " (mode 20 16 :right) " " filename)
     (mark " " (name 32 -1) " " filename))))
 '(line-spacing 0)
 '(linum-format "%4d| ")
 '(ruby-indent-tabs-mode t)
 '(safe-local-variable-values (quote ((folded-file . t) (encoding . utf-8))))
 '(template-default-alist nil)
 '(template-directory-list nil)
 '(template-header-regexp nil)
 '(template-query nil)
 '(vline-global-mode nil)
 '(uniquify-buffer-name-style (quote post-forward))
 '(git-state-modeline-decoration (quote git-state-decoration-letter)))

(custom-theme-set-faces
 'r2d2t
 '(default ((t (:foreground "white"))))
 '(region ((t (:background "cyan"))))
 '(font-lock-variable-name-face ((t (:foreground "yellow"))))
 '(font-lock-builtin-face ((t (:foreground "brightyellow"))))
 '(minibuffer-prompt ((t (:foreground "cyan"))))
 '(highlight-symbol-face ((t (:background "brightred" :foreground "red" :underline t))))
 '(ido-only-match ((t (:foreground "green"))))
 '(ido-subdir ((t (:foreground "cyan"))))
 '(ido-first-match ((t (:foreground "green"))))
 '(hl-line ((t (:background "balck"))))
 '(org-tag ((t (:foreground "red"))))
 '(vline ((t (:background "black"))))
 '(font-lock-keyword-face ((t (:foreground "yellow"))))
 '(dired-directory ((t (:foreground "green"))))
 '(font-lock-comment-face ((t (:foreground "cyan"))))
 '(ac-selection-face ((t (:background "red")))))

(provide-theme 'r2d2t)
