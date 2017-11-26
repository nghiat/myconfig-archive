(let ((frame-background-mode 'light)) (frame-set-background-mode nil))
(global-linum-mode t)
(savehist-mode 1)
(setq x-select-enable-clipboard t)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq make-backup-files nil)
(electric-pair-mode)

(setq inhibit-startup-screen t)

(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(infer-indentation-style)

(local-set-key (kbd "DEL") 'backward-delete-whitespace-to-column)

(provide 'init-general)
