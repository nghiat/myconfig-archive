(setq auto-save-default nil)
;; https://emacs.stackexchange.com/questions/28736/emacs-pointcursor-movement-lag/28746
(setq auto-window-vscroll nil)
(setq column-number-mode t)
(setq custom-safe-themes t)
;; Ignore whitespace
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; Filename filepath
(setq frame-title-format '("%b %f"))
(setq history-length 1000)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq recentf-max-saved-items nil)
(setq recentf-max-menu-items 1000)
(setq-default show-trailing-whitespace t)
(setq tab-width 4)
(setq tab-stop-list (number-sequence 4 200 4))
;; Disable emacs built-in vc.
(setq vc-handled-backends nil)
(setq visible-bell 1)
(setq x-select-enable-clipboard t)

(fset 'format-code (lambda()()))

(electric-indent-mode 1)
(electric-pair-mode)
(global-auto-revert-mode t)
(global-eldoc-mode -1)
(global-hl-line-mode)
(infer-indentation-style)
(load-theme 'ez t)
(menu-bar-mode -1)
(recentf-mode 1)
(run-at-time nil (* 5 60) 'recentf-save-list)
(savehist-mode 1)
(scroll-bar-mode -1)
(semantic-mode 1)
(show-paren-mode 1)
(tool-bar-mode -1)
;; Previous recently buffer
(global-set-key (kbd "C-c o") 'mode-line-other-buffer)
(global-set-key (kbd "C-c s") 'ff-find-other-file)
(global-set-key (kbd "<f5>") 'shell-command)
(global-set-key (kbd "<f6>") 'compile)
(global-set-key (kbd "\C-s") 'save-buffer)

(add-hook 'after-change-major-mode-hook
          (lambda ()
            (modify-syntax-entry ?- "w")
            (modify-syntax-entry ?_ "w")))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq c-basic-offset 2)
            (setq c-syntactic-indentation nil)))

(add-hook 'prog-mode-hook #'hs-minor-mode)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq-default mode-line-format
              '(;; value of current buffer name
               "(%b) "
               ;; directory
               "("
               default-directory
               ") "
               ;; major mode
               "("
               mode-name
               ") "
               ;; line number, column number
               "(%l:%C) "
               ))
(provide 'init-general)
