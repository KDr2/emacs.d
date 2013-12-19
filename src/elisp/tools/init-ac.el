;;; init-ac.el --- atuo-complete mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require-package 'auto-complete)
(require-package 'auto-complete-clang)

;;(add-non-elpa-load-path "/auto-complete")

(when (require 'auto-complete)
  (require 'auto-complete-clang)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (setq ac-auto-start 3)
  ;;(setq ac-auto-start nil)
  (define-key ac-mode-map (kbd "M-/") 'auto-complete)
  ;;(add-hook 'emacs-lisp-mode-hook
  ;;          (lambda ()
  ;;            (make-local-variable 'ac-sources)
  ;;            (setq ac-sources '(ac-source-symbols
  ;;                               ;;ac-source-yasnippet
  ;;                               ac-source-abbrev
  ;;                               ac-source-words-in-buffer
  ;;                               ac-source-words-in-all-buffer
  ;;                               ac-source-files-in-current-dir
  ;;                               ac-source-filename
  ;;                               ))))
  ;;(defvar ac-source-etags
  ;;'((candidates
  ;;    . (lambda () (all-completions ac-target (tags-completion-table))))))
  ;;(defun c-mode-ac-source ()
  ;;  (make-local-variable 'ac-sources)
  ;;  (add-to-list 'ac-sources 'ac-source-clang))
  ;;(add-hook 'c-mode-common-hook 'c-mode-ac-source)
  )
(global-auto-complete-mode t)

;;clang for c/cc
(do-on-os
 "darwin"
 (setq ac-clang-flags
       (mapcar
        (lambda (item) (concat "-I" item))
        '("/opt/local/include/gcc46/c++/"
          "/opt/local/include/gcc46/c++/x86_64-apple-darwin11"
          "/opt/local/include/gcc46/c++/backward"
          "/opt/local/lib/gcc46/gcc/x86_64-apple-darwin11/4.6.3/include"
          "/opt/local/include"
          "/opt/local/lib/gcc46/gcc/x86_64-apple-darwin11/4.6.3/include-fixed"
          "/usr/include"
          "/System/Library/Frameworks"
          "/Library/Frameworks"))))

(do-on-os
 "gnu/linux"
 (setq ac-clang-flags
       (mapcar (lambda (item) (concat "-I" item))
               '("/usr/include"
                 "/usr/include/x86_64-linux-gnu/"
                 "/usr/lib/gcc/x86_64-linux-gnu/4.4/include"
                 "/usr/include/c++/4.4"
                 "/usr/include/c++/4.4/x86_64-linux-gnu"
                 "/usr/include/c++/4.4/backward/"))))

(defun clang-ac-cc-mode-setup ()
  (if (not (member (file-name-extension (or (buffer-file-name) "")) '("php" "inc")))
      (setq ac-sources (append '(ac-source-clang) ac-sources))))

(do-on-os
 "gnu/linux"
 (add-hook 'c-mode-hook 'clang-ac-cc-mode-setup)
 (add-hook 'c++-mode-hook 'clang-ac-cc-mode-setup))

(provide 'init-ac)
