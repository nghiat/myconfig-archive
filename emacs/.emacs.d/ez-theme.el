(deftheme ez
    "Inspired by chromium code search https://cs.chromium.org")

(custom-theme-set-faces
 'ez
 '(font-lock-comment-face ((t (:foreground "#880000"))))
 '(font-lock-string-face ((t (:foreground "#008800"))))
 '(font-lock-keyword-face ((t (:foreground "#0000ff"))))
 '(font-lock-builtin-face ((t (:foreground "#000000"))))
 '(font-lock-function-name-face ((t (:foreground "#000000"))))
 '(font-lock-variable-name-face ((t (:foreground "#000000"))))
 '(font-lock-type-face ((t (:foreground "#000000"))))
 '(font-lock-constant-face ((t (:foreground "#000000")))))

(provide-theme 'ez)
