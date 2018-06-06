;;; init-vars.el --- variables for my boxes

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(setq vars-debian-x230
      '((exec-path . ("/home/kdr2/programs/bin"
                      "/home/kdr2/programs/luajit/bin"))
        (non-elpa . t)
        (lang-extra-modes . (julia ess auctex
                                   pde ruby ocaml go php))
        (xfont . "monospace-11")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (orgmode-src-dir . "~/Work/opensrc/org-mode/")
        (org-dir . "~/Work/mine/sanctum")
        (org-mobile-dir . "~/Pool/Dropbox/MobileOrg")
        (org-publish-dir . "~/Pool/Dropbox/Phone/kbuildup")
        (ecl-path . "/home/kdr2/programs/ecl/bin/ecl")
        (ecl-dev-path . "/home/kdr2/programs/ecl/bin/ecl")
        (sbcl-path . "/usr/bin/sbcl")
        (ccl-path . "/home/kdr2/programs/ccl/dx86cl64")
        (clisp-path . "/usr/bin/clisp")
        (go-src-path . "~/Work/opensrc/go")
        (cscope-command . "/usr/bin/cscope -b")
        (org-babel-lang-extra . ((perl . t)
                                 (C . t)
                                 (ditaa . t)
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))
        (os-name . "linux")))

(setq vars-vm-debian64
      '((exec-path . ("/data0/usr/bin"))
        (non-elpa . t)
        (lang-extra-modes . (ess auctex pde ruby php))
        (xfont . "courier new-14")
        (work-dir . "/data0/source")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-mbp-mc724
      '((exec-path . ("~/Programs/bin"))
        (non-elpa . t)
        (lang-extra-modes . (ess auctex pde ruby php))
        (xfont . "monaco-14")
        (work-dir . "~/Work")
        (org-dir . "~/Work/mine/sanctum")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "darwin")))

(setq vars-linux-server
      '((exec-path . ("~/programs/bin"))
        (lang-extra-modes . (php pde go))
        (work-dir . "~/")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))


(setq vars-wsl-ubuntu
      '((exec-path . ("~/programs/bin"))
        (lang-extra-modes . (php pde))
        (work-dir . "/mnt/d/work")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")
        (org-dir . "/mnt/d/work/mine/sanctum")
        (os-name . "linux")))


(setq vars-platforms
      (list
       (cons "linux-pc" vars-debian-x230)
       (cons "linux-vm" vars-vm-debian64)
       (cons "mbp-mc724" vars-mbp-mc724)
       (cons "linux-server" vars-linux-server)
       (cons "wsl-ubuntu" vars-wsl-ubuntu)))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc box-name vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))

(defmacro if-lang (feature &rest body)
  `(if (memq ,feature (vars-get 'lang-extra-modes))
       (progn ,@body)))

(provide 'init-vars)
