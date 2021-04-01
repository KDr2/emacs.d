;;; init-cscope.el

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; cscope settings

(require 'init-elpa)

(require-package 'xcscope)


(setq exec-path (cons "/opt/local/bin" exec-path))

;; run cscope if there's a file named 'project.cscope' under the dir
(defun update-cscope ()
  (interactive)
  (if (or (file-exists-p "project.cscope") (file-exists-p "cscope.project"))
      (progn
        (shell-command "find . -type f|grep -E \"\\.(s|S|h|c|hpp|cc|cpp|py|erl)$\">cscope.files")
        (shell-command (vars-get 'cscope-command))
        (message "cscope tags updated!"))
    (message "nothing to do!")))
(global-set-key "\C-cu" 'update-cscope)

(provide 'init-cscope)
