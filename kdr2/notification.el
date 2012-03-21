;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
