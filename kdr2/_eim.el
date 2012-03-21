

(add-to-list 'load-path "~/.emacs.d/3rdparties/eim")
(autoload 'eim-use-package "eim" "Another emacs input method")
;; Tooltip
(setq eim-use-tooltip nil)

;;(register-input-method
;; "eim-wb" "euc-cn" 'eim-use-package
;; "五笔" "汉字五笔输入法" "wb.txt")
(register-input-method
 "eim-py" "euc-cn" 'eim-use-package
 "拼音" "汉字拼音输入法" "py.txt")

;; 用 ; 暂时输入英文
(require 'eim-extra)
(global-set-key ";" 'eim-insert-ascii)
