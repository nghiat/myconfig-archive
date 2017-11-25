(global-flycheck-mode)
(eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(provide 'init-flycheck)
