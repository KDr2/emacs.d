;;; Wombat Theme Customization

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
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
 '(uniquify-buffer-name-style (quote post-forward))
 '(git-state-modeline-decoration (quote git-state-decoration-letter)))

(custom-theme-set-faces
 'wombat
 ;;'(default ((t (:foreground "gray"))))
 '(highlight ((t ())))
 '(region ((t (:background "wheat4"))))
 '(highlight-symbol-face ((t (:background "wheat4"
                                          :foreground "wheat"
                                          :underline t))))
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
 '(font-lock-keyword-face ((t (:foreground "yellow"))))
 '(dired-directory ((t (:foreground "green"))))
 '(font-lock-comment-face ((t (:foreground "cyan"))))
 '(ac-selection-face ((t (:background "red"))))
 '(show-paren-match-face ((t (:background "gray40"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "gray70"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "magenta"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "purple"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "red"))))
 '(cperl-hash-face ((t (:background "darkgreen"
                                    :foreground "wheat"
                                    :slant italic :weight bold)))))
