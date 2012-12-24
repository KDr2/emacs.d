;;; vars.el --- variables for my boxes

;; Copyright (C) 2012 KDr2

;; Author   : KDr2 <killy.draw@gmail.com>
;; URL      : https://github.com/KDr2/k.emacs.d
;; Version  : 0.7
;; Keywords : KDr2

;; This file is not part of GNU Emacs.
;;



(setq vars-macosx
      '((xfont . "courier new-14")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (org-dir . "~/Work/mine/org")
        (org-mobile-dir . "/tmp")
        (org-publish-dir . "/Volumes/KDr2/Sites/kbuildup")
        (erlang-root-dir . "~/Developer/otp/R14B02")
        (ecl-path . "~/Developer/ecl/bin/ecl")
        (ecl-dev-path . "/opt/kdr2/Hacking/ecl-dev/bin/ecl")
        (sbcl-path . "~/Developer/bin/sbcl")
        (ccl-path . "~/Developer/ccl/dx86cl64")
        (go-src-path . "/Volumes/KDr2/Work/opensrc/go")
        (cscope-command . "/opt/local/bin/cscope -b")
        (os-name . "darwin")))

(setq vars-debian-x230
      '((xfont . "monospace-9")
        (work-dir . "~/Work")
        (backup-dir . "~/.backup/emacs")
        (org-dir . "~/Work/mine/org")
        (org-mobile-dir . "~/Pool/Dropbox/MobileOrg")
        (org-publish-dir . "~/Pool/Dropbox/Phone/kbuildup")
        (erlang-root-dir . "/opt/programs/otp/14b02")
        (ecl-path . "/opt/programs/ecl/bin/ecl")
        (ecl-dev-path . "/opt/programs/ecl/bin/ecl")
        (sbcl-path . "/usr/bin/sbcl")
        (ccl-path . "~/Developer/ccl/dx86cl64")
        (go-src-path . "~/Work/opensrc/go")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-vm-debian64
      '((xfont . "courier new-14")
        (work-dir . "/vmshare/mwork")
        (backup-dir . "~/.backup/emacs")
        (org-dir . "/vmshare/mwork/mine/org")
        (org-mobile-dir . "/tmp")
        (org-publish-dir . "/tmp")
        (erlang-root-dir . "~/Developer/otp/R14B02")
        (ecl-path . "/opt/programs/ecl/bin/ecl")
        (ecl-dev-path . "/opt/programs/ecl/bin/ecl")
        (sbcl-path . "~/Developer/bin/sbcl")
        (ccl-path . "~/Developer/ccl/dx86cl64")
        (go-src-path . "/vmshare/mwork/opensrc/go")
        (cscope-command . "/usr/bin/cscope -b")
        (os-name . "linux")))

(setq vars-platforms
      (list
       (cons "KDr2-MacBookPro.local" vars-macosx)
       (cons "Debian-X230" vars-debian-x230)
       (cons "vm-debian64" vars-vm-debian64)))

(defun vars-get (key &optional default)
  "Get a var value for given key"
  (let ((platform-vars (cdr (assoc system-name vars-platforms))))
    (or (cdr (assoc key platform-vars))
        default)))
