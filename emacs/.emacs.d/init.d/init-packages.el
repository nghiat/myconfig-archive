(require 'package)
(setq package-enable-at-startup nil)
(if (getenv "http_proxy")
    ;Use local mirror 
    (progn
        (unless (file-directory-p "~/.emacs.d/mirror-elpa")
	    ((let ((default-directory "~/.emacs.d"))
                (shell-command-to-string "git clone https://github.com/d12frosted/elpa-mirror"))))
        (setq package-archives '(("melpa" . "~/.emacs.d/mirror-elpa/melpa/")
                         ("org"   . "~/.emacs.d/mirror-elpa/org/")
                         ("gnu"   . "~/.emacs.d/mirror-elpa/gnu/"))))
    (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org"   . "https://marmalade-repo.org/packages/")
                         ("gnu"   . "https://elpa.gnu.org/packages/"))))
(package-initialize)
;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(use-package diminish)

(use-package undo-tree
  :diminish undo-tree-mode)

(use-package autorevert
  :diminish auto-revert-mode)

(use-package abbrev
  :ensure nil
  :diminish abbrev-mode)

(use-package magit
  :bind
  ("C-c m s" . magit-status)
  ("C-c m d" . magit-diff-buffer-file))

(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode)
  (evil-leader/set-key
   "h" 'evil-window-left
   "j" 'evil-window-down
   "k" 'evil-window-up
   "l" 'evil-window-right))

(use-package evil
  :config
  (evil-mode 1)
  (fset 'evil-visual-update-x-selection 'ignore)
  (setq evil-symbol-word-search t)
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq evil-shift-width 2))))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard t))

(use-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode))

(use-package ranger
  :bind ("<f7>" . ranger))

(use-package company
  :config
  :init
  (global-company-mode)
  :config
  (add-hook 'c++-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '(company-dabbrev))))
  (add-hook 'c-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   '(company-dabbrev))))
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-other-buffers 'all)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-other-buffers (quote all))
  (setq company-dabbrev-code-modes t)
  (setq company-dabbrev-ignore-buffers "nil")
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

(use-package projectile
  :diminish projectile-mode
  :config
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  (projectile-mode))

(use-package org
  :config
  (setq org-log-done 'time))

(use-package cmake-mode)

(use-package lua-mode)

(use-package elpy
  :config
  (elpy-enable))

(use-package qml-mode
  :config
  (autoload 'qml-mode "qml-mode" "Editing Qt Declarative." t)
  (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode)))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-c c f" . counsel-find-file)
  ("C-c c g" . counsel-ag)
  ("C-c c r" . counsel-recentf))

(use-package swiper
  :bind
  ("\C-s" . swiper))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package ivy
  :diminish ivy-mode
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-re-builders-alist
      '((ivy-switch-buffer . ivy--regex-plus)
        (t . ivy--regex-fuzzy))))

(use-package smex
  :config
  (smex-initialize))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode))

(use-package clang-format
  :bind
  ("\C-c l" . clang-format-region))

(use-package sr-speedbar
  :bind
  ("<f8>" . sr-speedbar-toggle))

(use-package nyan-mode
  :config
  (nyan-mode)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail)
  (setq nyan-animate-nyancat t))

(use-package ggtags
  :config
  (add-hook 'c-mode-common-hook
            (lambda ()
              (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
                (ggtags-mode 1)))))

(use-package counsel-gtags)

(use-package flx)

(provide 'init-packages)
