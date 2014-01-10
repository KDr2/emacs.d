;;; init-vars.el --- variables for my boxes

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(setq vars-debian-x230
      '((exec-path . ("/home/kdr2/programs/bin"
                      "/home/kdr2/programs/luajit/bin"
                      "/home/kdr2/programs/python27/bin/"))
        (lang-extra-modes . (julia ess auctex
                                   pde ruby ocaml go php))
        (xfont . "monospace-11")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (org-dir . "~/Work/mine/org")
        (org-mobile-dir . "~/Pool/Dropbox/MobileOrg")
        (org-publish-dir . "~/Pool/Dropbox/Phone/kbuildup")
        (erlang-root-dir . "/opt/programs/otp/14b02")
        (ecl-path . "/home/kdr2/programs/ecl/bin/ecl")
        (ecl-dev-path . "/home/kdr2/programs/ecl/bin/ecl")
        (sbcl-path . "/usr/bin/sbcl")
        (ccl-path . "~/Developer/ccl/dx86cl64")
        (go-src-path . "~/Work/opensrc/go")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-vm-debian64
      '((exec-path . ("/data0/usr/bin"))
        (lang-extra-modes . (ess auctex pde ruby php))
        (xfont . "courier new-14")
        (work-dir . "/data0/source")
        (backup-dir . "~/.backup/emacs")
        (erlang-root-dir . "/data0/usr/local/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-mbp-mc724
      '((exec-path . ("~/Programs/bin"))
        (lang-extra-modes . (ess auctex pde ruby php))
        (xfont . "courier new-14")
        (work-dir . "~/Work")
        (org-dir . "~/Work/mine/org")
        (backup-dir . "~/.backup/emacs")
        (erlang-root-dir . "~/Programs/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "darwin")))

(setq vars-linux-server
      '((exec-path . ("~/programs/bin"))
        (lang-extra-modes . (php pde))
        (work-dir . "~/")
        (backup-dir . "~/.backup/emacs")
		(erlang-root-dir . "~/Programs/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-platforms
      (list
       (cons "linux-pc" vars-debian-x230)
       (cons "linux-vm" vars-vm-debian64)
       (cons "darwin" vars-mbp-mc724)
       (cons "linux-server" vars-linux-server)))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc (box-type) vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))

(provide 'init-vars)
