;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Basic Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;append  load-path
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/3rdparties")
(add-to-list 'load-path "~/.emacs.d/kdr2")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;=======kdr2-ext-settings===
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/kdr2/main.el")


(defun file-string (file)
    "Read the contents of a file and return as a string."
    (with-temp-buffer
      (insert-file-contents file)
      (buffer-string)))


;;custom-settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(canlock-password "eea8e2f6e38400fe57a3ad7190f1a31c797398b3")
 '(default-input-method "eim-py")
 (list 'org-export-html-style (file-string "~/.emacs.d/kdr2/org-mode.css"))
 '(org-export-html-style-include-default nil)
 '(pde-load-path "~/.emacs.d/3rdparties/pde/")
 '(pde-perl-version "5.10.0"))

(put 'upcase-region 'disabled nil)

