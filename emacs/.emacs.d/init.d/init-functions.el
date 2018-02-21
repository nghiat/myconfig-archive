(defun infer-indentation-style ()
  ;; if our source file uses tabs, we use tabs, if spaces spaces, and if       
  ;; neither, we use the current indent-tabs-mode                              
  (let ((space-count (how-many "^  " (point-min) (point-max)))
        (tab-count (how-many "^\t" (point-min) (point-max))))
    (if (> space-count tab-count) (setq indent-tabs-mode nil))
    (if (> tab-count space-count) (setq indent-tabs-mode t))))

;; https://stackoverflow.com/questions/1450169/how-do-i-emulate-vims-softtabstop-in-emacs
(defun backward-delete-whitespace-to-column ()
  "delete back to the previous column of whitespace, or as much whitespace as possible,
or just one char if that's not possible"
  (interactive)
  (if indent-tabs-mode
      (call-interactively 'backward-delete-char-untabify)
    (let ((movement (% (current-column) tab-width))
          (p (point)))
      (when (= movement 0) (setq movement tab-width))
      (save-match-data
        (if (string-match "\\w*\\(\\s-+\\)$" (buffer-substring-no-properties (- p movement) p))
            (backward-delete-char-untabify (- (match-end 1) (match-beginning 1)))
        (call-interactively 'backward-delete-char-untabify))))))

(setq current-theme-index 0)
(defun switch-theme (themes-list)
  "Switch theme in THEMES-LIST."
  (interactive)
  (setq current-theme-index
	(mod (+ current-theme-index 1) (length themes-list)))
  (setq current-theme-name (nth current-theme-index themes-list))
  (load-theme current-theme-name t)
  (princ "Loaded theme: ")
  (princ current-theme-name))

(provide 'init-functions)
