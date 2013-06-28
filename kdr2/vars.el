;;; vars.el --- variables for my boxes

;; Copyright (C) 2010-2013 KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;

(setq vars-debian-x230
      '((exec-path . ("/home/kdr2/programs/bin"
                      "/home/kdr2/programs/luajit/bin"
                      "/home/kdr2/programs/python27/bin/"))
        (lang-extra-modes . (ess auctex pde ruby ocaml go php))
        (xfont . "monospace-9")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (org-dir . "~/Work/mine/org")
        (org-mobile-dir . "~/Pool/Dropbox/MobileOrg")
        (org-publish-dir . "~/Pool/Dropbox/Phone/kbuildup")
        (erlang-root-dir . "/opt/programs/otp/14b02")
        (ecl-path . "/opt/programs/ecl/bin/ecl")
        (ecl-dev-path . "/opt/programs/ecl/bin/ecl")
        (sbcl-path . "/usr/bin/sbcl")
        (ccl-path . "~/Developer/ccl/dx86cl64")
        (go-src-path . "~/Work/opensrc/go")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-vm-debian64
      '((exec-path . ("/data0/usr/bin"))
        (lang-extra-modes . (ess auctex pde ruby))
        (xfont . "courier new-14")
        (work-dir . "/data0/source")
        (backup-dir . "~/.backup/emacs")
        (erlang-root-dir . "/data0/usr/local/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-mbp-mc724
      '((exec-path . ("~/Programs/bin"))
        (lang-extra-modes . (ess auctex ruby))
        (xfont . "monaco-12")
        (work-dir . "~")
        (backup-dir . "~/.backup/emacs")
        (erlang-root-dir . "~/Programs/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "darwin")))

(setq vars-platforms
      (list
       (cons "Debian-X230" vars-debian-x230)
       (cons "Debian64-QEMU" vars-vm-debian64)
       (cons "KDr2-MC724.local" vars-mbp-mc724)))

(defun hostname ()
  (if (string= system-name "localhost")
      (if (string= system-type "darwin")
          "KDr2-MC724.local"
        system-name)
    system-name))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc (hostname) vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))
