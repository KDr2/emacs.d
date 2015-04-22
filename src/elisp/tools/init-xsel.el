;;; init-xsel.el --- cut/paste under terminal settings for KDr2's Emacs

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;

;; requirements: xsel

(setq x-select-enable-clipboard t)

(setq external-clip-program
      '((gnu/linux .
                   (("xsel" "--clipboard" "--input") ("xsel" "--clipboard" "--output")))
        (darwin .
                 (("pbcopy") ("pbpaste")))))


(defun should-use-external-clip ()
  (and (not window-system)
       (or (and (eq system-type 'gnu/linux) (getenv "DISPLAY") (executable-find "xsel"))
           (and (eq system-type 'darwin) (executable-find "pbcopy") (executable-find "pbpaste")))))

(if (should-use-external-clip)
    (lexical-let ((copy-prog (nth 0 (cdr (assoc system-type external-clip-program))))
                  (paste-prog (nth 1 (cdr (assoc system-type external-clip-program)))))
      ;; Callback for when user cuts
      (defun xsel-cut-function (text &optional push)
        ;; Insert text to temp-buffer, and "send" content to xsel stdin
        (with-temp-buffer
          (insert text)
          ;; I prefer using the "clipboard" selection (the one the
          ;; typically is used by c-c/c-v) before the primary selection
          ;; (that uses mouse-select/middle-button-click)
          (apply 'call-process-region (point-min) (point-max) (car copy-prog) nil 0 nil (cdr copy-prog))))
      ;; Call back for when user pastes
      (defun xsel-paste-function ()
        ;; Find out what is current selection by xsel. If it is different
        ;; from the top of the kill-ring (car kill-ring), then return
        ;; it. Else, nil is returned, so whatever is in the top of the
        ;; kill-ring will be used.
        (with-temp-buffer
          (let* ((status (apply 'call-process (car paste-prog) nil t nil (cdr paste-prog)))
                 (text (buffer-string)))
            (if (and (= status 0) (not (string= (car kill-ring) text)))
                text))))
      ;; Attach callbacks to hooks
      (setq interprogram-cut-function 'xsel-cut-function)
      (setq interprogram-paste-function 'xsel-paste-function)))

(provide 'init-xsel)
