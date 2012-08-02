;;; notification.el --- notification settings

;; Copyright (C) 2012 KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;

;;; Notifications
(do-on-os "gnu/linux"
          (defvar notifications ())
          (defvar notifications-on t)
          (defun setup-notify ()
            (require 'notify)
            (run-with-timer 1 600 (lambda ()
                                    (if (and  window-system notifications-on)
                                        (notify "Go Back to Emacs Please!!!"
                                                "Is every thing done ???")))))
          (defun toggle-notification ()
            (interactive)
            (setq notifications-on (not notifications-on)))
          (setup-notify))


