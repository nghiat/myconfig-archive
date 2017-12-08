(let ((frame-background-mode 'light)) (frame-set-background-mode nil))
(global-linum-mode t)
(savehist-mode 1)
(setq x-select-enable-clipboard t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key "\C-x\ \C-h" 'previous-buffer)
(global-set-key "\C-x\ \C-l" 'next-buffer)
(global-set-key "\C-s" 'save-buffer)

(setq make-backup-files nil)
(electric-pair-mode)

(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(show-paren-mode 1)
(infer-indentation-style)

(local-set-key (kbd "DEL") 'backward-delete-whitespace-to-column)

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;Ignore whitespace
(setq ediff-diff-options "-w")

(setq-default history-length 10000)

(provide 'init-general)
