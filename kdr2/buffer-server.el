;;
;; buffer-server.el
;; author : KDr2
;;

(defun buffer-index-html ()
  (let ((ret "<html>"))
    (dolist (buf (buffer-list))
      (let ((bname (buffer-name buf)))
        (setq ret (concat ret (format "<a href=\"/buffers/%s\">%s</a><br>" bname bname)))))
    (setq ret (concat ret "</html>"))
    ret))

(defun pathinfo-to-buffer (pathinfo)
  (if (string-match "/buffers/\\(.+\\)$" pathinfo)
      (progn 
        (setq bn (match-string 1 pathinfo))
        (get-buffer bn))
    nil))

(defun get-buffer-content-and-kill (buffer)
  (let ((content (with-current-buffer buffer
                   (buffer-substring-no-properties (point-min) (point-max)))))
    (kill-buffer buffer)
    content))

(defun org-or-html-content (basename)
  (if (get-buffer (concat basename ".org"))
      (progn
        (with-current-buffer (get-buffer (concat basename ".org"))
        (org-export-as-html 3))
        (get-buffer-content-and-kill (get-buffer (concat basename ".html"))))
    (if (get-buffer (concat basename ".html"))
        (progn
          (get-buffer-content-and-kill (get-buffer (concat basename ".html"))))
      "No sunch Buffer")))

(defun buffers-handler (httpcon)
  "Buffers Handler"
  (let* ((path (elnode-http-pathinfo httpcon)))
    (elnode-http-start httpcon 200 '("Content-type" . "text/html"))
    (elnode-http-return 
     httpcon
     (if (string-match "/buffers/\\(.*\\)\\.\\(org\\|html\\)$" path)
         (let ((basename (match-string 1 path)))
           (org-or-html-content basename))
       (if (pathinfo-to-buffer path)
           (get-buffer-content-and-kill (htmlize-buffer (pathinfo-to-buffer path)))
         (buffer-index-html))))))


(elnode-start 'buffers-handler :port 8010 :host "localhost")

;;
;;(elnode-stop 8010)
;;


