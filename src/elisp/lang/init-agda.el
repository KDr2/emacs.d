;;; init-agda.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; load agda mode

(let* ((coding-system-for-read 'utf-8)
       (agda-dir (or (vars-get 'agda-dir)
                     (concat (getenv "HOME") "/.cabal/bin")))
       (agda-exe (or (vars-get 'agda-exe) "agda-2.8.0"))
       (agda-path (concat agda-dir "/" agda-exe)))
  (if (file-exists-p agda-path)
      (load-file (shell-command-to-string (concat agda-path " --emacs-mode locate")))))

(provide 'init-agda)
