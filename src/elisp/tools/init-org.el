;;; init-org.el --- org-mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; (when (< emacs-major-version 24)
;;   (require-package 'org))

(require-package 'org)
(require-package 'org-plus-contrib)
(require-package 'org-fstree)

(setq org-directory (vars-get 'org-dir))
(setq org-mobile-directory (vars-get 'org-mobile-dir))
(setq org-mobile-inbox-for-pull (concat org-directory "/mobile.org"))
(setq org-archive-location "archives/%s_archive::")
(setq org-src-fontify-natively t)
(setq org-export-publishing-directory (concat (vars-get 'work-dir) "/tmp/org-export"))

;; html export settings for V7.*
;;(setq org-export-html-validation-link nil)
;;(setq org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />")
;;(setq org-export-html-style-include-default nil)

;; html export settings for V8.*
;;(setq org-html-validation-link nil)
(setq org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/style.css\" />")
(setq org-html-head-include-default-style nil)


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

(defvar mn-html-head-extra
  "
<link rel=\"alternate\" type=\"application/rss+xml\"
      href=\"http://kdr2.com/site-log.xml\"
      title=\"RSS feed for KDr2\">
<script src=\"http://code.jquery.com/jquery-1.10.1.min.js\"></script>
<script src=\"/script/mn-site.js\"></script>")

(defvar mn-html-preamble
  "<div class='nav'>
<ul>
<li id=\"site-name\"></li>
<li><a href='/'>Home</a></li>
<li><a target='_blank' href='http://github.com/KDr2'>GitHub</a></li>
<li><a target='_blank' href='http://kdr2.net'>Tumblr</a></li>
<li><a href='/about.html'>About</a></li>
<li class=\"search\">
<form method=\"get\" action=\"http://www.google.com/search\">
  <input type=\"text\" name=\"q\" size=\"31\" maxlength=\"255\" value=\"\" />
  <input type=\"hidden\" id=\"sitesearch\" name=\"sitesearch\" value=\"kdr2.com\" />
  <input type=\"submit\" value=\"Search\" class=\"button\" />
</form>
</li>
</ul>
</div>")

(defvar mn-html-postamble
  "
<p>Copyright &copy; %a, <a href=\"http://creativecommons.org/licenses/by-nc-nd/3.0/\">SOME RIGHTS RESERVED</a>. </p>
<p>Last updated: %C. </p>
<p>Built with %c. </p>
")

(require 'org-publish)
(let ((kb-output-dir (vars-get 'org-publish-dir))
      (kb-source-dir (concat org-directory "/kbuildup"))
      (mn-output-dir (concat (vars-get 'work-dir) "/mine/kdr2-on-web/output"))
      (mn-source-dir (concat (vars-get 'work-dir) "/mine/kdr2-on-web")))
  (setq org-publish-project-alist
        `(("kb-org"
           :base-directory ,kb-source-dir
           :base-extension "org"
           :publishing-directory ,kb-output-dir
           :recursive t
           :publishing-function (org-html-publish-to-html)
           :headline-levels 3
           :auto-preamble t
           )
          ("kb-static"
           :base-directory ,(concat kb-source-dir "/static")
           :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory ,(concat kb-output-dir "/static")
           :recursive t
           :publishing-function (org-publish-attachment)
           )
          ("kb" :components ("kb-org" "kb-static"))
          ("mn-org"
           :base-directory ,mn-source-dir
           :base-extension "org"
           :publishing-directory ,mn-output-dir
           :recursive t
           :publishing-function (org-html-publish-to-html)
           :html-head-extra ,mn-html-head-extra
           :html-preamble ,mn-html-preamble
           :html-postamble ,mn-html-postamble
           :headline-levels 3
           :auto-preamble t
           :exclude "README.org"
           )
          ("mn-rss"
           :base-directory ,mn-source-dir
           :base-extension "org"
           :publishing-directory ,mn-output-dir
           :publishing-function (org-rss-publish-to-rss)
           :html-link-home "http://kdr2.com/"
           :html-link-use-abs-url t
           :exclude ".*"
           :include ("site-log.org"))
          ("mn-static"
           :base-directory ,(concat mn-source-dir "/static")
           :base-extension "css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory ,mn-output-dir
           :recursive t
           :publishing-function (org-publish-attachment)
           )
          ("mn" :components ("mn-org" "mn-rss" "mn-static")))))

(defun kb-pub ()
  (interactive)
  ;;(let ((org-export-html-style ""))
  (org-publish-project "kb" t))

(defun org-export-signle-page ()
  (interactive)
  (let ((org-html-head
         (xhtml-css-from-file "~/.emacs.d/src/resources/org-theme-hy.css"))
        (org-export-show-temporary-export-buffer nil))
    (org-html-export-to-html nil nil nil nil '(:publishing-directory "~"))))

(provide 'init-org)
