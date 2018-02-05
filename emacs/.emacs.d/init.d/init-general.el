(setq column-number-mode t)
;Ignore whitespace
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;Filename filepath
(setq frame-title-format '("%b %f"))
(setq history-length 100)
(setq indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq recentf-max-menu-items 100)
(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq x-select-enable-clipboard t)

(electric-indent-mode 1)
(electric-pair-mode)
(global-auto-revert-mode t)
(global-linum-mode t)
(infer-indentation-style)
(recentf-mode 1)
(savehist-mode 1)
(semantic-mode 1)
(show-paren-mode 1)

(global-set-key (kbd "M-o") 'mode-line-other-buffer)
(global-set-key (kbd "M-f") 'ff-find-other-file)
(global-set-key (kbd "<f6>") 'compile)

(add-hook 'c++-mode-hook 
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (setq c-basic-offset 2)
            (setq c-syntactic-indentation nil)
            (setq whitespace-line-column 99)
            (setq whitespace-style '(face lines-tail))
            (whitespace-mode)))

(add-hook 'prog-mode-hook #'hs-minor-mode)

(when window-system (set-frame-size (selected-frame) 150 35))

(provide 'init-general)
