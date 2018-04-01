;;; init-org.el --- org-mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; (when (< emacs-major-version 24)
;;   (require-package 'org))

(if (vars-get 'orgmode-src-dir)
    (progn
      (add-to-list 'load-path (concat (vars-get 'orgmode-src-dir) "lisp"))
      (add-to-list 'load-path (concat (vars-get 'orgmode-src-dir) "contrib/lisp"))
      (require 'org)
      (require 'ox-rss))
    (progn
      (require 'init-elpa)
      (require-package 'org)
      (require-package 'org-plus-contrib)
      (require-package 'org-fstree)))

(require 'ox)
;;(require 'ox-publish)

(setq org-directory (vars-get 'org-dir))
(setq org-archive-location "archives/%s_archive::")
(setq org-src-fontify-natively t)
(setq org-export-publishing-directory (concat (vars-get 'work-dir) "/tmp/org-export"))

;; html export settings for V8.*
;;(setq org-html-validation-link nil)
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />")
(setq org-html-head-include-default-style nil)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-todo-keywords
      '((sequence "TODO" "DELY" "PROC" "WAIT" "|" "DONE" "CNCL")))
(setq org-agenda-files (concatenate 'list
                                    (file-expand-wildcards (concat org-directory "/content/main.org"))
                                    (file-expand-wildcards (concat org-directory "/content/work/*.org"))))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;org-capture
(setq org-default-notes-file (concat org-directory "/content/main.org"))
(setq org-capture-templates
      '(("i" "Issue" entry (file+headline (concat org-directory "/content/main.org") "Issues")
         "* TODO %?\n  %a\n")
        ("n" "Note" entry (file+headline (concat org-directory "/content/main.org") "Notes")
         "* TODO %?\n  %a\n")
        ("l" "Work-Log" entry (file+datetree (concat org-directory "/content/work/worklog.org"))
         "* %?\n")
        ("j" "Journal" entry (file+datetree+prompt (concat org-directory "/content/writing/journal.org"))
         "* %?\n  Entered on %U\n")))
(define-key global-map "\C-cc" 'org-capture)

(defadvice org-html-paragraph (before org-html-paragraph-advice
                                      (paragraph contents info) activate)
  "Join consecutive Chinese lines into a single long line without
unwanted space when exporting org-mode to html."
  (let* ((orig-contents (ad-get-arg 1))
         (reg-mb "[[:multibyte:]]")
         (fixed-contents (replace-regexp-in-string
                          (concat "\\(" reg-mb
                                  "\\) *\n *\\(" reg-mb "\\)")
                          "\\1\\2" orig-contents)))
    (ad-set-arg 1 fixed-contents)))

;; load basic languages support
(org-babel-do-load-languages
 'org-babel-load-languages
 '((awk . t)
   (dot . t)
   (emacs-lisp . t)
   (makefile . t)
   (org . t)
   (perl . t)
   (python . t)
   (R . t)
   (sh . t)))

;; load extra languages support
(if (vars-get 'org-babel-lang-extra)
    (org-babel-do-load-languages
     'org-babel-load-languages
     (vars-get 'org-babel-lang-extra)))

(defun org-export-signle-page ()
  (interactive)
  (let ((org-html-head
         (xhtml-css-from-file "~/.emacs.d/src/resources/org-theme-hy.css"))
        (org-export-show-temporary-export-buffer nil))
    (org-html-export-to-html nil nil nil nil '(:publishing-directory "~"))))

(provide 'init-org)
