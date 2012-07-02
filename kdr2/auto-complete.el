;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; atuo-complete mode settings
(add-to-list 'load-path "~/.emacs.d/3rdparties/auto-complete")

(when (require 'auto-complete)
  (require 'auto-complete-clang)
  (global-auto-complete-mode t)
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (setq ac-auto-start 3)
  ;;(setq ac-auto-start nil)
  (define-key ac-mode-map (kbd "M-/") 'auto-complete)
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (make-local-variable 'ac-sources)
              (setq ac-sources '(
                                 ac-source-symbols
                                 ;;ac-source-yasnippet
                                 ac-source-abbrev
                                 ac-source-words-in-buffer
                                 ac-source-words-in-all-buffer
                                 ac-source-files-in-current-dir
                                 ac-source-filename
                                 ))))
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

(setq ac-clang-flags
      (mapcar (lambda (item) (concat "-I" item))
              (split-string
               "/opt/local/include/gcc46/c++/
                /opt/local/include/gcc46/c++//x86_64-apple-darwin11
                /opt/local/include/gcc46/c++//backward
                /opt/local/lib/gcc46/gcc/x86_64-apple-darwin11/4.6.3/include
                /opt/local/include
                /opt/local/lib/gcc46/gcc/x86_64-apple-darwin11/4.6.3/include-fixed
                /usr/include
                /System/Library/Frameworks
                /Library/Frameworks")))
(defun clang-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang) ac-sources)))
;;(add-hook 'c-mode-common-hook 'clang-ac-cc-mode-setup)

