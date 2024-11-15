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
                      "~/programs/local/bin"
                      "~/work/mine/DS-III/bin"
                      "~/work/mine/DS-III/local/bin"))
        (non-elpa . nil)
        (lang-extra-modes . (rust clojure julia slime))
        (agda-dir . "~/.cabal/bin") ;; where agda-mode is located
        ;; orgmode settings
        ;; (orgmode-src-dir . "~/work/hall/org-mode/")
        (org-dir . "~/work/mine/bok/org")
        (org-babel-lang-extra . ((perl . t)
                                 (clojure . t)
                                 (js . t)
                                 (julia . t)
                                 (latex . t)
                                 (lisp . t)
                                 (scheme . t)))
        ;; executables
        (cscope-command . "/usr/bin/cscope -b")))

(setq vars-empty '())

(setq vars-full
      '((work-dir . "~/work")
        (backup-dir . "~/.backup/emacs")
        (exec-path . ("~/programs/bin"
                      "~/programs/local/bin"
                      "~/work/mine/DS-III/bin"
                      "~/work/mine/DS-III/local/bin"))
        (non-elpa . t)
        (lang-extra-modes . (rust clojure julia slime auctex pde scala go))
        ;; ui settings
        (xfont . "monospace-11")
        ;; orgmode settings
        (orgmode-src-dir . "~/work/hall/org-mode/")
        (agda-dir . "~/.cabal/bin") ;; where agda-mode is located
        (org-dir . "~/work/mine/bok/org")
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
        (elpy-python . (concat user-emacs-directory "elpy/rpc-venv/bin/python"))
        (cscope-command . "/usr/bin/cscope -b")))


(let ((user-file (concat user-emacs-directory "vars-user.el")))
  (if (file-exists-p user-file)
      (progn
        (ignore-errors (load-file user-file))
        (if (not (boundp 'vars-user))
            (message "[WARNING] Variable `vars-user` is not well defined, using the default vars.")))
    (message "[Warning] No `vars-user.el` found, using the default vars.")))

(setq vars-all
      (list
       (cons "default" vars-default)
       (cons "full" vars-full)
       (cons "user" (if (boundp 'vars-user) vars-user vars-empty))))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((user-vars (cdr (assoc "user" vars-all)))
        (defaut-vars (cdr (assoc "default" vars-all))))
    (or (cdr (assoc key user-vars))
        (cdr (assoc key defaut-vars))
        default)))

(defvar non-elpa-enabled
  (and (file-exists-p non-elpa-load-path) (vars-get 'non-elpa)))

(defmacro if-lang (feature &rest body)
  `(if (memq ,feature (vars-get 'lang-extra-modes))
       (progn ,@body)))

(provide 'init-vars)
