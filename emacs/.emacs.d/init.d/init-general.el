(load-theme 'gruvbox-dark-hard t)
(let ((frame-background-mode 'light)) (frame-set-background-mode nil))
(global-linum-mode t)
(savehist-mode 1)
(setq x-select-enable-clipboard t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq make-backup-files nil)
(electric-pair-mode)

(provide 'init-general)
