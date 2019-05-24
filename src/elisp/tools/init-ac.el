;;; init-ac.el --- atuo-complete mode settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <zhuo.dev@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

(require 'init-elpa)

(require-package 'auto-complete)


(when (require 'auto-complete)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (setq ac-auto-start 3)
  (define-key ac-mode-map (kbd "M-/") 'auto-complete))

(global-auto-complete-mode t)

;;clang for c/cc
(do-on-os
 "NONE"
 (require-package 'auto-complete-clang)
 (require 'auto-complete-clang)
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
  (add-hook 'c++-mode-hook 'clang-ac-cc-mode-setup)))

(provide 'init-ac)
