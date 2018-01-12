(let ((frame-background-mode 'light)) (frame-set-background-mode nil))
(global-linum-mode t)
(savehist-mode 1)
(setq x-select-enable-clipboard t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(setq make-backup-files nil)
(electric-pair-mode)

(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(infer-indentation-style)
(electric-indent-mode 1)

(show-paren-mode 1)

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;Ignore whitespace
(setq ediff-diff-options "-w")

(setq-default history-length 10000)

(add-hook 'c++-mode-hook 
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (setq c-syntactic-indentation nil)
            (setq c-basic-offset 2)
            (setq whitespace-line-column 99)
            (setq whitespace-style '(face lines-tail))
            (whitespace-mode)))

(add-hook 'prog-mode-hook #'hs-minor-mode)

(setq-default frame-title-format '("%b"))

(global-set-key (kbd "M-o") 'mode-line-other-buffer)

(when window-system (set-frame-size (selected-frame) 100 40))

(semantic-mode 1)

(provide 'init-general)
