;;; init-vars.el --- variables for my boxes

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(setq vars-default
      '((work-dir . "~/")
        (backup-dir . "~/.backup/emacs")
        (exec-path . ("~/programs/bin"
                      "~/Work/mine/DS-III/gen-bin"))
        (non-elpa . nil)
        (lang-extra-modes . (slime clojure julia))
        ;; orgmode settings
        ;; (orgmode-src-dir . "~/Work/hall/org-mode/")
        (org-dir . "~/Work/mine/sanctum")
        (org-babel-lang-extra . ((perl . t)
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))
        ;; executables
        (cscope-command . "/usr/bin/cscope -b")))

(setq vars-full
      '((work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (exec-path . ("/home/kdr2/programs/bin"
                      "/home/kdr2/Work/mine/DS-III/gen-bin"))
        (non-elpa . t)
        (lang-extra-modes . (julia auctex pde go slime scala clojure))
        ;; ui settings
        (xfont . "monospace-11")
        ;; orgmode settings
        (orgmode-src-dir . "~/Work/opensrc/org-mode/")
        (org-dir . "~/Work/mine/sanctum")
        (org-babel-lang-extra . ((perl . t)
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))
        ;; executables
        (ecl-path . "/usr/bin/ecl")
        (sbcl-path . "/usr/bin/sbcl")
        (clisp-path . "/usr/bin/clisp")
        (elpy-python . "/home/kdr2/.pyenv/versions/cft36/bin/python")
        (cscope-command . "/usr/bin/cscope -b")))


(let ((user-vars (concat user-emacs-directory "vars-user.el")))
  (if (file-exists-p user-vars)
      (progn
        (ignore-errors (load-file user-vars))
        (if (not (boundp 'vars-user))
            (warn "Variable `vars-user` is not well defined, using the default vars.")))
    (warn "No `vars-user.el` found, using the default vars.")))

(setq vars-platforms
      (list
       (cons "default" vars-default)
       (cons "full" vars-full)
       (cons "user" (if (boundp 'vars-user) vars-user vars-default))))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc "user" vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))

(defvar non-elpa-enabled
  (and (file-exists-p non-elpa-load-path) (vars-get 'non-elpa)))

(defmacro if-lang (feature &rest body)
  `(if (memq ,feature (vars-get 'lang-extra-modes))
       (progn ,@body)))

(provide 'init-vars)
