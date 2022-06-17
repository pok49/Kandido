(defun aside ()
  (interactive)
  (let (p id n c)
    (setq p (point-min))
    (while (progn
             (goto-char (point-max))
             (re-search-backward "<div id=\"\\(.+\\)\">
<h4>\\(\\[[0-9]+\\]\\)</h4>
<p>\\(.+\\)</p>
</div>
") p t)
      (setq id (match-string 1)
            n (match-string 2)
            c (match-string 3))
      (delete-region (match-beginning 0) (match-end 0))
                                        ; ---
(message "n=.%s., id=.%s.\n" n id)
      (goto-char p)
      (search-forward (concat "<a href=\"#" id "\">" n "</a>"))
       (replace-match (format "%s<span class=\"aside\">%s %s</span>"
                              n n c)))
      (setq p (point))))

; ---------------------
(defun h>fb2 (beg end) "html > fb2"
  (interactive "r")
  (save-restriction
    (narrow-to-region beg end)
    (goto-char (point-min))
    (while (re-search-forward "<\\(h[1-9]\\)\\>\\([^>]*>\\)\\(.+\\)</\\1>" nil t)
      (replace-match "<section\\2<title><p>\\3</p></title>"))
    (goto-char (point-min))
    (while (re-search-forward " lang=\"\\w\\w\"" nil t) (replace-match ""))
    (goto-char (point-min))
    (while (re-search-forward "\\<\\(em\\|i\\)>" nil t) (replace-match "emphasis>"))
    (goto-char (point-min))
    (while (re-search-forward "\\<blockquote>" nil t) (replace-match "cite>"))
    (goto-char (point-min))
    (while (re-search-forward "<a href=\"" nil t) (replace-match "<a l:href=\""))
    (goto-char (point-min))
    (while (re-search-forward "\\<del>" nil t) (replace-match "strikethrough>"))
    ))
