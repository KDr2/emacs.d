;;; _gnus.el --- gnus settings for KDr2's Emacs

;; Copyright (C) 2012 KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;



;;===================GNUS========================
(setq user-full-name "KDr2")
(setq user-mail-address "KDr2@163.com")
(setq gnus-select-method '(nntp "news.cn99.com"))
(setq gnus-secondary-select-methods '((nnfolder "")))
(setq gnus-default-subscribed-newsgroups
      '(
        "cn.bbs.comp.emacs"
        "cn.bbs.comp.c"
        "comp.unix.programmer"
        "comp.unix.shell"
        "comp.unix.admin"
        "comp.lang.c"
        "comp.lang.c++"
        ;;"comp.lang.perl.misc"
        ;;"comp.lang.php"
        ;;"comp.lang.ruby"
        ))
(setq gnus-use-cache 'passive)

;;===FetchMail===
(eval-after-load "mail-source"
  '(add-to-list 'mail-sources '(maildir :path "/home/kdr2/Mail/Inbox"
                                        :subdirs ("cur" "new" "tmp"))))

;;===Smtp=======
(setq message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-default-smtp-server "smtp.163.com")
(setq smtpmail-smtp-service 25)
(setq smtpmail-auth-credentials
      '(("smtp.163.com"
         25
         "kdr2"
         "password")))


(setq mm-coding-system-priorities '(iso-8859-1  chinese-iso-8bit chinese-big5 utf-8))

(defun prefer-gbk ()
  (setq mm-coding-system-priorities
        '(iso-8859-1 gbk utf-8)))
(defun prefer-utf-8 ()
  (setq mm-coding-system-priorities
        '(iso-8859-1 utf-8)))

(setq gnus-posting-styles
      '(
        ("cn\\.bbs.*"
         (signature-file "~/.emacs.d/signature.txt")
         (name "KDr2")
         (address "KDr2@163.com")
         (Bcc "KDr2_bak@163.com")
         (eval (prefer-gbk)))
        (".*"
         (signature-file "~/.emacs.d/signature.txt")
         (name "KDr2")
         (address "KDr2@163.com")
         (Bcc "KDr2_bak@163.com")
         ;; (face (gnus-convert-png-to-face "~/.emacs.d/face.png"))
         )
        )
      )

(setq gnus-message-archive-group
      '((if (message-news-p)
            "nnfolder:mail.sent.news"
          "nnfolder:mail.sent.mail")))
(setq gnus-use-cache 'passive)
;;============END OF GNUS========================

