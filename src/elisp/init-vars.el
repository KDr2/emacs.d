;;; init-vars.el --- variables for my boxes

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(setq vars-debian-x230
      '((os-name . "linux")
        (exec-path . ("/home/kdr2/programs/bin"
                      "/home/kdr2/Work/mine/DS-III/gen-bin"))
        (non-elpa . t)
        (lang-extra-modes . (julia auctex pde go slime))
        (xfont . "monospace-11")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (orgmode-src-dir . "~/Work/opensrc/org-mode/")
        (org-dir . "~/Work/mine/sanctum")
        (ecl-path . "/usr/bin/ecl")
        (sbcl-path . "/usr/bin/sbcl")
        (clisp-path . "/usr/bin/clisp")
        (cscope-command . "/usr/bin/cscope -b")
        (elpy-python . "/home/kdr2/.pyenv/versions/cft36/bin/python")
        (org-babel-lang-extra . ((perl . t)
                                 (C . t)
                                 (ditaa . t)
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))))

(setq vars-vm-debian64
      '((os-name . "linux")
        (exec-path . ("/data0/usr/bin"))
        (non-elpa . t)
        (lang-extra-modes . (pde go php))
        (xfont . "courier new-14")
        (work-dir . "/data0/source")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")))

(setq vars-mbp-mc724
      '((os-name . "darwin")
        (exec-path . ("~/Programs/bin"))
        (non-elpa . t)
        (lang-extra-modes . (ess auctex pde ruby php))
        (xfont . "monaco-14")
        (work-dir . "~/Work")
        (org-dir . "~/Work/mine/sanctum")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")))

(setq vars-linux-server
      '((os-name . "linux")
        (exec-path . ("~/programs/bin"))
        (lang-extra-modes . (php pde go))
        (work-dir . "~/")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")))


(setq vars-wsl-ubuntu
      '((os-name . "linux")
        (exec-path . ("~/programs/bin"))
        (lang-extra-modes . (php pde))
        (work-dir . "/mnt/d/work")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")
        (org-dir . "/mnt/d/work/mine/sanctum")))


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
