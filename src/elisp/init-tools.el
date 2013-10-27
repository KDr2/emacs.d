;;; init-lang.el --- load tool modes 

;; Copyright (C) KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/emacs.d

;; This file is not part of GNU Emacs.
;;


(add-to-list 'load-path
             (concatenate 'string user-emacs-directory "src/elisp/tools"))

;; ibuffer
(require 'init-ibuffer)

;; org mode
(require 'init-org)

;; chinese input method
(require 'init-eim)

;; magit mode
(require 'init-magit)

;; auto-complete
(require 'init-ac)

;; utils
(require 'init-utils)

(provide 'init-tools)

