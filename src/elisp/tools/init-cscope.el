;;; init-cscope.el

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;; cscope settings
(require 'xcscope)

;;cscope标签更新(有project.cscope的目录下);
(setq exec-path (cons "/opt/local/bin" exec-path))
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
