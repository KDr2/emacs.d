(setq vars-user
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
