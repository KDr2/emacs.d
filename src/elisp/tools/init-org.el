;;; init-org.el --- org-mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(when (< emacs-major-version 24)
  (require-package 'org))
(require-package 'org-fstree)

;;(require 'org-install)

(setq org-directory (vars-get 'org-dir))
(setq org-mobile-directory (vars-get 'org-mobile-dir))
(setq org-mobile-inbox-for-pull (concat org-directory "/mobile.org"))
(setq org-archive-location "archives/%s_archive::")
(setq org-src-fontify-natively t)

;; html export
(setq org-export-html-validation-link nil)
;;(setq org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />")
(setq org-export-html-style-include-default nil)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-todo-keywords
      '((sequence "TODO" "DELY" "PROC" "WAIT" "|" "DONE" "CNCL")))
(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;org-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/task.org") "TODO'S")
         "* TODO %?\n  %a\n")
        ("n" "Note" entry (file+headline (concat org-directory "/task.org") "Notes")
         "* TODO %?\n  %a\n")
        ("w" "Work-Task" entry (file+headline (concat org-directory "/worklog.org") "Tasks")
         "* TODO %?\n  %a\n")
        ("l" "Work-Log" entry (file+datetree (concat org-directory "/worklog.org"))
         "* %?\n  %a\n")
        ("j" "Journal" entry (file+datetree+prompt (concat org-directory "/journal.org"))
         "* %?\n  Entered on %U\n")
        ("c" "Code-View" entry (file+datetree (concat org-directory "/codeview.org"))
         "* TODO %?\n  Viewed on %U\n  %a\n")))
(define-key global-map "\C-cc" 'org-capture)

(setq org-export-publishing-directory (concat (vars-get 'work-dir) "/tmp/org-export"))

(defun org-dblock-write:graphviz (params)
  (let ((file (plist-get params :file))
        (title (or (plist-get params :title) "Image"))
        (is-inline (plist-get params :inline))
        (is-xinline (plist-get params :xinline)))
    (if (string-match "\\(.+\\)\\.dot" file)
        (let ((basename (match-string 1 file)))
          ;;dot -Tpng aw_newar.dot -o outfile.png
          (shell-command (format "dot -Tpng %s.dot -o %s.png" basename basename))
          (if is-inline
              (if nil ;;is-xinline
                  (let ((b64 (shell-command-to-string (format "base64 -b 80 %s.png" basename))))
                    (insert (format "#+BEGIN_HTML\n<img src=\"data:image/png;base64,%s\"/>\n#+END_HTML" b64)))
                (insert (format "[[%s.png]]" basename basename)))
            (insert (format "[[%s.png][%s]]" basename title basename)))))))


(require 'org-publish)
(let ((kb-output-dir (vars-get 'org-publish-dir))
      (kb-source-dir (concat org-directory "/kbuildup"))
      (mn-output-dir (concat org-directory "/mindniche/output"))
      (mn-source-dir (concat org-directory "/mindniche")))
  (setq org-publish-project-alist
        (list
         (list
          "kb-org"
          :base-directory kb-source-dir
          :base-extension "org"
          :publishing-directory kb-output-dir
          :recursive t
          :publishing-function 'org-publish-org-to-html
          :headline-levels 3
          :auto-preamble t
          :makeindex t
          )
         (list
          "kb-static"
          :base-directory kb-source-dir
          :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory kb-output-dir
          :recursive t
          :publishing-function 'org-publish-attachment
          )
         '("kb" :components ("kb-org" "kb-static"))
         (list
          "mn-org"
          :base-directory mn-source-dir
          :base-extension "org"
          :publishing-directory mn-output-dir
          :recursive t
          :publishing-function 'org-publish-org-to-html
          :headline-levels 3
          :auto-preamble t
          :makeindex t
          )
         (list
          "mn-static"
          :base-directory (concat mn-source-dir "/static")
          :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
          :publishing-directory mn-output-dir
          :recursive t
          :publishing-function 'org-publish-attachment
          )
         '("mn" :components ("mn-org" "mn-static")))))

(defun kb-pub ()
  (interactive)
  ;;(let ((org-export-html-style ""))
  (org-publish-project "kb" t))

(defun org-export-signle-page ()
  (interactive)
  (let ((org-export-html-style
         (xhtml-css-from-file "~/.emacs.d/src/resources/org-theme-hy.css")))
    (kill-buffer (org-export-as-html 3 '() nil))))

(provide 'init-org)
