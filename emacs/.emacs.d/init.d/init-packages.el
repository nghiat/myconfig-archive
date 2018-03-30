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

(use-package abbrev
  :ensure nil)

(use-package clang-format
  :hook
  ((c-mode c++-mode) . (lambda()  (fset 'format-code 'clang-format-region))))

(use-package cmake-mode)

(use-package company
  :config
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-modes t)
  (setq company-dabbrev-code-other-buffers (quote all))
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-buffers "nil")
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-other-buffers 'all)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  :hook
  ((c-mode c++-mode) . (lambda ()
			 (set (make-local-variable 'company-backends)
			      '(company-dabbrev))))
  :init
  (global-company-mode))

(use-package counsel
  :bind
  ("C-c c g" . counsel-ag)
  ("M-f" . counsel-find-file)
  ("M-x" . counsel-M-x)
  ("M-r" . counsel-recentf))

(use-package counsel-gtags)

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package elpy
  :config
  (elpy-enable)
  :hook
  (python-mode . (lambda() (fset 'format-code 'elpy-format-code))))

(use-package evil
  :config
  (evil-mode 1)
  (fset 'evil-visual-update-x-selection 'ignore)
  (setq evil-symbol-word-search t)
  (setq evil-want-fine-undo t)
  :hook
  (c++-mode . (lambda () (setq evil-shift-width 2))))

(use-package evil-leader
  :config
  (evil-leader/set-key
   "h" 'evil-window-left
   "j" 'evil-window-down
   "k" 'evil-window-up
   "l" 'evil-window-right)
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode))

(use-package fill-column-indicator
  :config
  (fci-mode)
  :hook (c++-mode . (lambda () (setq fci-rule-column 100))))

(use-package flx)

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package ggtags)

(use-package ivy
  :bind
  ("C-c i r" . ivy-resume)
  ("M-l" . ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-virtual-buffers t))

(use-package lua-mode)

(use-package magit
  :bind
  ("C-c m d" . magit-diff-buffer-file)
  ("C-c m s" . magit-status))

(use-package nyan-mode
  :config
  (nyan-mode)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail)
  (setq nyan-animate-nyancat t))

(use-package org
  :config
  (setq org-log-done 'time))

(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t))

(use-package qml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))
  (autoload 'qml-mode "qml-mode" "Editing Qt Declarative." t))

(use-package ranger
  :bind ("<f7>" . ranger))

(use-package smex
  :config
  (smex-initialize))

(use-package sr-speedbar
  :bind
  ("<f8>" . sr-speedbar-toggle))

(use-package swiper
  :bind
  ("\C-s" . swiper))

(use-package tide
  :hook
  (before-save . 'tide-format-before-save)
  (typescript-mode . (lambda ()
		       (tide-setup)
		       (tide-hl-identifier-mode +1))))

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package yascroll
  :config
  (global-yascroll-bar-mode 1)
  (setq yascroll:delay-to-hide nil))

(provide 'init-packages)
