;;; init-org.el --- org-mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; (when (< emacs-major-version 24)
;;   (require-package 'org))

(if (and (vars-get 'orgmode-src-dir)
         (file-directory-p (vars-get 'orgmode-src-dir)))
    (progn
      (add-to-list 'load-path (concat (vars-get 'orgmode-src-dir) "lisp"))
      (add-to-list 'load-path (concat (vars-get 'orgmode-src-dir) "contrib/lisp"))
      (require 'org))
    (progn
      (require 'init-elpa)
      (require-package 'org)
      (require-package 'org-plus-contrib)))

(require 'ox)
(require 'ox-rss)
(require 'org-tempo)
;;(require 'ox-publish)

(setq org-directory (vars-get 'org-dir))
(setq org-archive-location "archives/%s_archive::")
(setq org-src-fontify-natively t)
(setq org-export-publishing-directory (concat (vars-get 'work-dir) "/tmp/org-export"))

;; babel library
(org-babel-lob-ingest (expand-file-name "~/.emacs.d/src/resources/org-babel-lib.org"))
;; html export settings for V8.*
;;(setq org-html-validation-link nil)
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />")
(setq org-html-head-include-default-style nil)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-todo-keywords
      '((sequence "TODO" "DELY" "PROC" "WAIT" "|" "DONE" "CNCL")))
(setq org-agenda-files (concatenate 'list
                                    (file-expand-wildcards (concat org-directory "/content/main.org"))
                                    (file-expand-wildcards (concat org-directory "/content/scrappy.org"))
                                    (file-expand-wildcards (concat org-directory "/content/work/*.org"))))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;org-capture
(setq org-default-notes-file (concat org-directory "/content/main.org"))
(setq org-capture-templates
      '(("i" "Issue" entry (file+headline (lambda () (concat org-directory "/content/scrappy.org")) "Issues")
         "* TODO %?\n  %a\n")
        ("n" "Scrappy Note" entry (file+datetree (lambda () (concat org-directory "/content/scrappy.org")))
         "* %?\n")
        ("l" "Work-Log" entry (file+datetree (lambda () (concat org-directory "/content/work/worklog.org")))
         "* %?\n")
        ("j" "Journal" entry (file+datetree+prompt (lambda () (concat org-directory "/content/writing/journal.org")))
         "* %?\n  Entered on %U\n")
        ("h" "Health-Note" entry (file+datetree (lambda () (concat org-directory "/content/writing/health.org")))
         "* %?\n")))
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
 '((org . t)
   (perl . t)
   (python . t)
   (dot . t)
   (emacs-lisp . t)
   (R . t)
   (makefile . t)))

;; load extra languages support
(if (cdr (assoc 'julia (vars-get 'org-babel-lang-extra)))
    (setq inferior-julia-program-name (expand-file-name "~/Work/julia/julia")))

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
