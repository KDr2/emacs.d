;;; init-gnus.el --- gnus settings for KDr2's Emacs

;; Copyright (C) KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;



(setq user-full-name "KDr2")
(setq user-mail-address (concat "killy.draw" "@" "gmail.com"))
;;(setq gnus-select-method '(nntp "news.cn99.com"))
;;(setq gnus-secondary-select-methods '((nnfolder "")))

(setq gnus-select-method '(nnimap "Mail"
                                  (nnimap-address "localhost")
                                  (nnimap-stream network)
                                  (nnimap-authenticator login)
                                  ;;(nnimap-server-port 993)
                                  ;;(nnimap-stream ssl)
                                  ))

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 user-mail-address nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-local-domain "kdr2.net")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")
(setq gnus-permanently-visible-groups ".*INBOX")
(setq message-kill-buffer-on-exit t)
;;(setq gnus-use-cache 'passive)
;;(gnus-demon-add-handler 'gnus-group-get-new-news 5 nil)

;; (setq gnus-default-subscribed-newsgroups
;;       '("cn.bbs.comp.emacs"
;;         "cn.bbs.comp.c"
;;         "comp.unix.programmer"
;;         "comp.unix.shell"
;;         "comp.unix.admin"
;;         "comp.lang.c"
;;         "comp.lang.c++"
;;         ;;"comp.lang.perl.misc"
;;         ;;"comp.lang.ruby"
;;         ))


;;===FetchMail===
;;(eval-after-load "mail-source"
;;  '(add-to-list 'mail-sources '(maildir :path "/home/kdr2/Mail/Inbox"
;;                                        :subdirs ("cur" "new" "tmp"))))


(setq mm-coding-system-priorities
      '(iso-8859-1  chinese-iso-8bit chinese-big5 utf-8))

(defun prefer-gbk ()
  (setq mm-coding-system-priorities
        '(iso-8859-1 gbk utf-8)))
(defun prefer-utf-8 ()
  (setq mm-coding-system-priorities
        '(iso-8859-1 utf-8)))

(setq gnus-posting-styles
      '(("cn\\.bbs.*"
         (signature-file "~/.emacs.d/signature.txt")
         (name "KDr2")
         (eval (prefer-gbk)))
        (".*"
         (signature-file "~/.emacs.d/signature.txt")
         (name "KDr2"))))

(setq gnus-message-archive-group
      '((if (message-news-p)
            "nnfolder:mail.sent.news"
          "nnfolder:mail.sent.mail")))


(provide 'init-gnus)
