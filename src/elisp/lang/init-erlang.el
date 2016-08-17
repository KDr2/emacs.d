;;; init-erlang.el 

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;;;Erlang Mode Settings

(require 'init-elpa)

(ignore-errors
  (require-package 'erlang))

(when (package-installed-p 'erlang)
  (require 'erlang-start))


(let ((v-erlang-root-dir (vars-get 'erlang-root-dir)))
  (if v-erlang-root-dir
      (progn
        (setq erlang-root-dir v-erlang-root-dir)
        
        (defun my-erlang-hook-function ()
          (imenu-add-to-menubar "Functions"))
        (add-hook 'erlang-mode-hook 'my-erlang-hook-function)
        
        (defun erlang-mode-extras ()
          "extras settings for erlang-mode"
          (auto-complete-mode 1)
          (make-local-variable 'ac-sources)
          (setq ac-sources '(
                             ac-source-symbols
                             ac-source-abbrev
                             ac-source-words-in-buffer
                             ac-source-words-in-all-buffer
                             ac-source-files-in-current-dir
                             ac-source-filename
                             )))
        (add-hook 'erlang-mode-hook 'erlang-mode-extras))))

(provide 'init-erlang)
