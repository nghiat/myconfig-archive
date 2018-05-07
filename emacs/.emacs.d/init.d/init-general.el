(setq auto-save-default nil)
; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)
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
(setq-default show-trailing-whitespace t)
(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
(setq visible-bell 1)
(setq x-select-enable-clipboard t)

(fset 'format-code (lambda()()))

(electric-indent-mode 1)
(electric-pair-mode)
(global-auto-revert-mode t)
(global-hl-line-mode)
(global-linum-mode t)
(infer-indentation-style)
(load-theme 'ez t)
(menu-bar-mode -1)
(recentf-mode 1)
(savehist-mode 1)
(semantic-mode 1)
(scroll-bar-mode -1)
(show-paren-mode 1)
(tool-bar-mode -1)

; Previous recently buffer
(global-set-key (kbd "C-c b p") 'mode-line-other-buffer)
(global-set-key (kbd "C-c f s") 'ff-find-other-file)
(global-set-key (kbd "<f5>") 'shell-command)
(global-set-key (kbd "<f6>") 'compile)
(global-set-key (kbd "\C-s") 'save-buffer)

(add-hook 'c++-mode-hook
          (lambda ()
            (modify-syntax-entry ?_ "w")
            (setq c-basic-offset 2)
            (setq c-syntactic-indentation nil)
            (setq whitespace-line-column 79)
            (setq whitespace-style '(face lines-tail))
            (whitespace-mode)))

(add-hook 'python-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))

(add-hook 'prog-mode-hook #'hs-minor-mode)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(provide 'init-general)
