(deftheme ez-dark)

(custom-theme-set-faces
  'ez-dark
  '(default ((t (:background "#000000" :foreground "#ffffff"))))
  '(font-lock-comment-face ((t (:foreground "#5fffff"))))
  '(font-lock-string-face ((t (:foreground "#ff5fff"))))
  '(font-lock-keyword-face ((t (:foreground "#ffff5f"))))
  '(font-lock-builtin-face ((t (:foreground "#ffffff"))))
  '(font-lock-function-name-face ((t (:foreground "#ffffff"))))
  '(font-lock-variable-name-face ((t (:foreground "#ffffff"))))
  '(font-lock-type-face ((t (:foreground "#ffffff"))))
  '(font-lock-constant-face ((t (:foreground "#ffffff"))))
  '(highlight ((t (:background "#444444"))))
  '(isearch ((t (:background "#87005f"))))
  '(region ((t (:background "#0087ff" :foreground "#000000"))))

  ;; company
  '(company-preview-common ((t (:background "#000000" :foreground "#ffffff" :weight bold))))
  '(company-scrollbar-bg ((t (:background "#ffffff"))))
  '(company-scrollbar-fg ((t (:foreground "#000000"))))
  '(company-tooltip ((t (:inherit 'highlight))))
  '(company-tooltip-common ((t (:foreground "#ffffff"))))
  '(company-tooltip-common-selection ((t (:foreground "#ffffff"))))
  '(company-tooltip-selection ((t (:inherit 'highlight :weight bold))))

  ;; evil
  '(evil-ex-search ((t (:inherit 'isearch))))
  '(evil-ex-lazy-highlight ((t (:inherit 'isearch))))
  '(evil-ex-substitute-matches ((t (:inherit 'isearch))))
  '(evil-ex-substitute-replacement ((t (:inherit 'isearch))))
)
(provide-theme 'ez)
