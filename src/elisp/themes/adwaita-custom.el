;;; Adwaita Theme Customization

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(custom-theme-set-variables
 'adwaita
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
 'adwaita
 ;;'(default ((t (:foreground "gray"))))
 '(highlight ((t ())))
 '(highlight-symbol-face ((t (:background "gray"))))
 '(ido-only-match ((t (:foreground "purple"))))
 '(ido-first-match ((t (:foreground "purple"))))
 '(font-lock-comment-face ((t (:foreground "gray54"))))
 '(font-lock-function-name-face ((t (:foreground "DeepSkyBlue3"))))
 '(org-tag ((t (:foreground "red"))))
 '(org-verbatim ((t (:foreground "wheat4"))))
 '(web-mode-html-tag-face ((t (:foreground "wheat4"))))
 '(web-mode-html-attr-name-face ((t (:foreground "wheat4"))))
 '(web-mode-html-tag-bracket-face ((t (:foreground "wheat4"))))
 '(web-mode-current-element-highlight-face ((t (:background "gray80"))))
 '(dired-directory ((t (:foreground "purple"))))
 '(ac-selection-face ((t (:background "red"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "SaddleBrown"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "SteelBlue2"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "CadetBlue"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "purple"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "cyan4"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red")))))
