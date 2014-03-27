;;; Wombat Theme Customization

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(custom-theme-set-variables
 'wombat
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
 'wombat
 ;;'(default ((t (:foreground "gray"))))
 '(highlight ((t ())))
 '(highlight-symbol-face ((t (:background "wheat4" :foreground "red" :underline t))))
 '(ido-only-match ((t (:foreground "green"))))
 '(ido-subdir ((t (:foreground "cyan"))))
 '(ido-first-match ((t (:foreground "green"))))
 '(org-tag ((t (:foreground "red"))))
 '(org-document-title ((t (:foreground "brightyellow"))))
 '(org-document-info ((t (:foreground "green"))))
 '(org-verbatim ((t (:foreground "wheat4"))))
 '(web-mode-html-tag-face ((t (:foreground "wheat4"))))
 '(web-mode-html-attr-name-face ((t (:foreground "wheat4"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "wheat4"))))
 '(hl-line ((t (:background "gray25"))))
 '(vline ((t (:background "black"))))
 '(font-lock-keyword-face ((t (:foreground "yellow"))))
 '(dired-directory ((t (:foreground "green"))))
 '(font-lock-comment-face ((t (:foreground "cyan"))))
 '(ac-selection-face ((t (:background "red")))))
