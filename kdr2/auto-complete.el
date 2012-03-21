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
                                 ;;ac-source-semantic
                                 ;;ac-source-yasnippet
                                 ac-source-abbrev
                                 ac-source-words-in-buffer
                                 ac-source-words-in-all-buffer
                                 ;;ac-source-imenu
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


