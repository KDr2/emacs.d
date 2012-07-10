;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KDr2's Emacs Settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;copy当前行
(defun copy-current-line()
  (interactive)
  (kill-ring-save
   (line-beginning-position)
   (line-end-position)))

;;保存当前会话
(load "desktop")
(desktop-load-default)
;;(desktop-read)
(defun desktop-cd()
  (interactive)
  (desktop-change-dir "~/.emacs.d/desktop"))
(defun desktop-sv()
  (interactive)
  (desktop-save "~/.emacs.d/desktop")
  (message "desktop saved"))
(global-set-key (kbd "s-s") 'desktop-sv)
;;(global-set-key (kbd "s-o") 'desktop-cd)

(defun x-new-frame-init (&optional frame)
  (interactive)
  (select-frame frame)
  (color-theme-and-fonts))

(add-hook 'after-make-frame-functions 'x-new-frame-init)

(defun current-major-mode-name ()
  (interactive)
  (message (symbol-name major-mode)))
(defun all-minor-mode-name ()
  (interactive)
  (message "%s" minor-mode-list))

(if window-system
    (setenv "LS_COLORS" "di=33;1"))


