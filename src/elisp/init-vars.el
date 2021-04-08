;;; init-vars.el --- variables for my boxes

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(setq vars-default
      '((os-name . "linux")
        (exec-path . ("~/programs/bin"))
        (work-dir . "~/")
        (org-dir . "~/Work/mine/sanctum")
        (backup-dir . "~/.backup/emacs")
        (non-elpa . nil)
        (lang-extra-modes . (slime clojure julia))
        (cscope-command . "/usr/bin/cscope -b")
        ;; (orgmode-src-dir . "~/Work/hall/org-mode/")
        (org-babel-lang-extra . ((perl . t)
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))))

(setq vars-debian-x230
      '((os-name . "linux")
        (exec-path . ("/home/kdr2/programs/bin"
                      "/home/kdr2/Work/mine/DS-III/gen-bin"))
        (non-elpa . t)
        (lang-extra-modes . (julia auctex pde go slime scala clojure))
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
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))))


(setq vars-wsl-ubuntu
      '((os-name . "linux")
        (exec-path . ("~/programs/bin"))
        (lang-extra-modes . (pde php))
        (work-dir . "/mnt/d/work")
        (backup-dir . "~/.backup/emacs")
        (cscope-command . "/usr/bin/cscope -b")
        (org-dir . "/mnt/d/work/mine/sanctum")))


(setq vars-platforms
      (list
       (cons "default" vars-default)
       (cons "linux-server" vars-default)
       (cons "linux-pc" vars-debian-x230)
       (cons "wsl-ubuntu" vars-wsl-ubuntu)))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc box-name vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))

(defvar non-elpa-enabled
  (and (file-exists-p non-elpa-load-path) (vars-get 'non-elpa)))

(defmacro if-lang (feature &rest body)
  `(if (memq ,feature (vars-get 'lang-extra-modes))
       (progn ,@body)))

(provide 'init-vars)
