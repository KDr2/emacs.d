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
        (lang-extra-modes . (ess auctex pde ruby ocaml go php))
        (xfont . "monospace-11")
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
        (xfont . "monaco-14")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (erlang-root-dir . "~/Programs/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "darwin")))

(setq vars-simple-server
      '((exec-path . ("~/programs/bin"))
        (lang-extra-modes . (php pde))
        (work-dir . "~/")
        (backup-dir . "~/.backup/emacs")
		(erlang-root-dir . "~/Programs/otp/R15B01")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-platforms
      (list
       (cons "Debian-X230" vars-debian-x230)
       (cons "Debian64-QEMU" vars-vm-debian64)
       (cons "KDr2-MC724" vars-mbp-mc724)
       (cons "KDr2-MC724.local" vars-mbp-mc724)
	   (cons "simple-server" vars-simple-server)))

(defun string/starts-with (s arg)
      "returns non-nil if string S starts with ARG.  Else nil."
      (cond ((>= (length s) (length arg))
             (string-equal (substring s 0 (length arg)) arg))
            (t nil)))

(defun hostname ()
  (let ((default-sysname '(("darwin" . "KDr2-MC724.local")
                           ("linux" . "Debian-X230"))))
    (if (string= system-name "localhost")
        (if (assoc (default-sysname))
            (cdr (assoc (default-sysname)))
          system-name)
	  (if (string/starts-with system-name "shop-dev")
		  "simple-server"
		system-name))))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc (hostname) vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))

(provide 'init-vars)
