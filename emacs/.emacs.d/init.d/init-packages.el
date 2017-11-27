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

(use-package magit)

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
  (define-key evil-normal-state-map (kbd "<tab>") 'evil-next-buffer)
  (define-key evil-normal-state-map (kbd "<backtab>") 'evil-prev-buffer))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox-dark-hard t))

(use-package flycheck
  :config
  (global-flycheck-mode))

(use-package flycheck-irony
  :config
  (eval-after-load 'flycheck
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

(use-package ranger
  :bind ("<f7>" . ranger))

(use-package company
  :bind (("C-n" . company-select-next-or-abort)
	 ("C-p" . company-select-previous-or-abort))
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t))

(use-package helm
  :bind (("M-x" . helm-M-x)
	 ("C-x r b" . helm-filter-bookmarks)
	 ("C-x C-f" . helm-find-files))
  :init
  (require 'helm-config)
  :config
  (helm-mode 1))

(use-package powerline
  :config
  (powerline-default-theme))

(use-package company-irony)

(use-package irony
  :config
  (eval-after-load 'company
    '(add-to-list 'company-backends '(company-irony-c-headers company-irony)))
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package company-irony-c-headers)

(use-package projectile
  :config
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  (projectile-mode))

(use-package helm-projectile
  :init
  (require 'helm-projectile)
  :config
  (helm-projectile-on))

(use-package org)

(use-package cmake-mode)

(provide 'init-packages)
