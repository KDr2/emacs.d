;;; init-ace-jump.el

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require-package 'ace-jump-mode)

(defun sl-isearch-ace-jump ()
  "use ace-jump within isearch."
  (interactive)
  (let ((string isearch-string)
        (result isearch-success))
    (flet ((signal (x y) nil))
      (isearch-cancel))
    (and result
         (> (length string) 0)
         (ace-jump-do string))))

(define-key isearch-mode-map (kbd "M-a")
  'sl-isearch-ace-jump)

(provide 'init-ace-jump)
