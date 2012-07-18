
;;; org-mode settings
;;(add-to-list 'load-path "~/.emacs.d/3rdparties/org/lisp")
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/Work/mine/org")
(setq org-mobile-inbox-for-pull (concat org-directory "mobile.org"))
;;(setq org-mobile-directory "~/Resources/Dropbox/MobileOrg")
(setq org-mobile-directory "/Volumes/webdav/org")
(setq org-todo-keywords
      '((sequence "TODO" "DELY" "PROC" "WAIT" "|" "DONE" "CNCL")))
(setq org-agenda-files (file-expand-wildcards (concat org-directory "/*.org")))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;org-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline (concat org-directory "/task.org") "Tasks")
         "* TODO %?\n  %a\n")
        ("w" "Work-Log" entry (file+headline (concat org-directory "/worklog.org") "Tasks")
         "* TODO %?\n  %a\n")
        ("l" "Work-Log" entry (file+datetree (concat org-directory "/worklog.org"))
         "* %?\n  %a\n")
        ("n" "KBuilup" entry (file+headline (concat org-directory "/kbuildup.org") "Notes")
         "* TODO %?\n  %a\n")
        ("j" "Journal" entry (file+datetree+prompt (concat org-directory "/journal.org"))
         "* %?\n  Entered on %U\n  %a\n")
        ("c" "Code-View" entry (file+datetree (concat org-directory "/codeview.org"))
         "* %?\n  Viewed on %U\n  %a\n")))
(define-key global-map "\C-cc" 'org-capture)

(setq org-export-publishing-directory "~/Work/tmp/org-export")

(defun org-dblock-write:graphviz (params)
  (let ((file (plist-get params :file))
        (title (or (plist-get params :title) "Image"))
        (is-inline (plist-get params :inline)))
    (if (string-match "\\(.+\\)\\.dot" file)
        (let ((basename (match-string 1 file)))
          ;;dot -Tpng aw_newar.dot -o outfile.png
          (shell-command (format "dot -Tpng %s.dot -o %s.png" basename basename))
          (if is-inline
              (insert (format "[[%s.png]]" basename))
            (insert (format "[[%s.png][%s]]" basename title)))))))


(require 'org-publish)
(let ((kb-output-dir "~/Sites/kbuildup")
      (kb-source-dir "~/Work/mine/org/kbuildup")) 
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
         :publishing-directory "~/Work/tmp/kbuildup/"
         :recursive t
         :publishing-function 'org-publish-attachment
         )
        '("kb" :components ("kb-org" "kb-static")))))

(defun kb-pub ()
  (interactive)
  ;;(let ((org-export-html-style ""))
  (org-publish-project "kb" t))

