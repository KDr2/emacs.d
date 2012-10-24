;;; util-modes.el --- util modes settings

;; Copyright (C) 2012 KDr2 

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;


;;; dired settings
(require 'dired)
(require 'dired-x)
(global-set-key "\C-x\C-j" 'dired-jump)
(define-key dired-mode-map "b" 'dired-mark-extension)
(define-key dired-mode-map "c" 'dired-up-directory)
(define-key dired-mode-map "e" 'dired-mark-files-containing-regexp)
(define-key dired-mode-map "o" 'chunyu-dired-open-explorer)
(define-key dired-mode-map "r" 'dired-mark-files-regexp)
(define-key dired-mode-map "/" 'dired-mark-directories)
(define-key dired-mode-map "K" 'dired-kill-subdir)
(define-key dired-mode-map [(control ?/)] 'dired-undo)

(defun explorer-dired ()
  (interactive)
  (let ((file-name (dired-get-file-for-visit)))
    (if (file-exists-p file-name)
        (w32-shell-execute "open" file-name nil 1))))

(setq dired-listing-switches "-avl"  ;; ls 文件列表参数
      dired-recursive-copies 'top    ;; 复制目录时，递归复制所有字目录
      dired-recursive-deletes 'top   ;; 删除目录时，递归删除所有字目录
      cvs-dired-use-hook 'always) ;; 浏览 CVS 时，自动打开 pcl-cvs 界面

;;; ido mode settings
(require 'ido)
(ido-mode t)
(setq ido-ignore-buffers
      '("\\` " "^\*Mess" "^\*Help" "^\*Back" "^\*Completion" "^\*Ido"))

;;; window-numbering
(require 'window-numbering)
(window-numbering-mode t)

;;; highlight-current-line mode settings
(require 'highlight-current-line)
(highlight-current-line-on t)

;;; vline mode settings
(require 'vline)
(global-set-key "\C-xt" 'vline-global-mode)

;;; undo-tree mode settings
(require 'undo-tree)
(global-undo-tree-mode)

;;; cscope settings
(require 'xcscope)
;;cscope标签更新(有project.cscope的目录下);
(setq exec-path (cons "/opt/local/bin" exec-path))
(defun update-cscope ()
  (interactive)
  (if (or (file-exists-p "project.cscope") (file-exists-p "cscope.project"))
      (progn
        (shell-command "find . -type f|grep -E \"\\.(s|S|h|c|hpp|cpp|py|erl)$\">cscope.files")
        (shell-command (vars-get 'cscope-command))
        (message "cscope tags updated!"))
    (message "nothing to do!")))
(global-set-key "\C-cu" 'update-cscope)

;;; uniquify settings
(require 'uniquify)

;;; thumbs settings
;;开启图片浏览
(require 'thumbs)
(auto-image-file-mode t)

;;; multi-term settings
(require 'multi-term)
(setq multi-term-program "/bin/bash")

;;; htmlize
(require 'htmlize)
;;(require 'find-recursive)
;; who need this?
(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))


(global-linum-mode t)

(require 'ace-jump-mode)

;;; hightlight-symbol settings
(require 'highlight-symbol)
(setq highlight-symbol-idle-delay 0.5)
(defun hl-s-turn-on ()
  (let ((mod-list '("c-mode"
                    "c++-mode"
                    "lua-mode"
                    "ruby-mode"
                    "erlang-mode"
                    "lisp-mode"
                    "cperl-mode"
                    "javascript-mode"
                    "emacs-lisp-mode"
                    "python-mode"
                    "tuareg-mode"
                    "graphviz-dot-mode")))
    (if (member (symbol-name major-mode) mod-list)
        (highlight-symbol-mode))))
(define-globalized-minor-mode
  global-highlight-symbol-mode
  highlight-symbol-mode hl-s-turn-on)
(global-highlight-symbol-mode)

;;; Gnus Settings
;;(load-file "~/.emacs.d/kdr2/_gnus.el")

;;; w3m settings
;;(add-to-list 'load-path "~/.emacs.d/3rdparties/emacs-w3m")
;;(require 'w3m)
;;set w3m as the default browser of emacs
;;(setq browse-url-browser-function 'w3m-browse-url)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(global-set-key "\C-xm" 'browse-url-at-point)


;;; Woman Settings
(setq woman-use-own-frame nil)
(setq woman-cache-level 3)
(setq woman-cache-filename "~/.wmcache.el")
(global-set-key "\C-cm" 'woman)

;;call woman by current word
(defun call-woman ()
  (interactive)
  (if (string-match "^[[:alnum:]_]+$" (current-word))
      (unless (woman (current-word))
        (message (concat "No manual for \"" (current-word) "\"")))))
(global-set-key "\C-xm" 'call-woman)


;; git-emacs
(add-to-list 'load-path "~/.emacs.d/3rdparties/git-emacs")
(setq git-state-modeline-decoration 'git-state-decoration-large-dot)
(require 'git-emacs-autoloads)


;; Trac

;; TODO
(require 'trac-wiki)
(autoload 'trac-wiki "trac-wiki"
  "Trac wiki editing entry-point." t)
(trac-wiki-define-project "trac-aw"
                          "http://trac.appwill.com/" t)


(load-file "~/.emacs.d/kdr2/_ibuffer.el")

;;(require 'highlight-tail)
;;(setq highlight-tail-colors
;;          '(("black" . 0)
;;            ("#bc2525" . 25)
;;            ("black" . 66)))
;;(setq highlight-tail-steps .1
;;      highlight-tail-timer .1)
;;(setq highlight-tail-posterior-type 'const)
;;(highlight-tail-mode nil)

(load-file "~/.emacs.d/kdr2/auto-complete.el")

;;mercurial.el
(setenv "PATH" (concat (getenv "PATH") ":/Volumes/KDr2/Developer/python27/bin"))
(setq exec-path (append exec-path '("/Volumes/KDr2/Developer/python27/bin")))
(require 'mercurial)


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

