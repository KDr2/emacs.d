;;; init-woman.el

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; Woman Settings
(setq woman-use-own-frame nil)
(setq woman-cache-level 3)
(setq woman-cache-filename "~/.wmcache.el")
(global-set-key "\C-cm" 'woman)

;;call woman by current word
(defun call-woman ()
  (interactive)
  (if (string-match "^[[:alnum:]_]+$" (current-word))
      (unless (woman (current-word))
        (message (concat "No manual for \"" (current-word) "\"")))))
(global-set-key "\C-xm" 'call-woman)

(provide 'init-woman)
