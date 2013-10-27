;;; init-ibuffer.el --- ibuffer settings for KDr2's Emacs

;; Copyright (C) KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d

;; This file is not part of GNU Emacs.
;;


(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)


(eval-after-load "ibuf-ext"
  '(define-ibuffer-filter filename
     "Toggle current view to buffers with file or directory name matching QUALIFIER."
     (:description "filename"
                   :reader (read-from-minibuffer "Filter by file/directory name (regexp): "))
     (ibuffer-awhen (or (buffer-local-value 'buffer-file-name buf)
                        (buffer-local-value 'dired-directory buf))
                    (string-match qualifier it))))


;;
;;(defun my-ibuffer-hook ()
;;  
;;  ;; add another sorting method for ibuffer (allow the grouping of
;;  ;; filenames and dired buffers
;;  
;;  (ibuffer-define-sorter pathname
;;                         (:documentation
;;                          "Sort the buffers by their pathname."
;;                          :description "path")
;;                         (string-lessp (with-current-buffer (car a)
;;                                         (or buffer-file-name
;;                                             (if (eq major-mode 'dired-mode)
;;                                                 (expand-file-name dired-directory))
;;                                             ;; so that all non pathnames are at the end
;;                             "~"))
;;                                       (with-current-buffer (car b)
;;                                         (or buffer-file-name
;;                                             (if (eq major-mode 'dired-mode)
;;                                                 (expand-file-name dired-directory))
;;                                             ;; so that all non pathnames are at the end
;;                                             "~"))))
;;  ;; add key binding
;;  (define-key ibuffer-mode-map (kbd "s p") 'ibuffer-do-sort-by-pathname))
;;(add-hook 'ibuffer-mode-hooks 'my-ibuffer-hook)
;;
;;(defun ibuffer-limit-by-path ()
;;  (interactive)
;;  (let ((key (read-from-minibuffer "keyword for path: ")))
;;    (ibuffer)
;;    (ibuffer-limit-disable)
;;    (ibuffer-limit-by-filename (concatenate 'string ".*" key ".*"))))
;;(define-key global-map "\M-p" 'ibuffer-limit-by-path)
;;

(provide 'init-ibuffer)
