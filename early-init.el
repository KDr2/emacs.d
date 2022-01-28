;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)

(setq package-user-dir
      (concat package-user-dir "-"
              (number-to-string emacs-major-version)))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
