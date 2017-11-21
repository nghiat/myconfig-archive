(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile (require 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil magit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 16777215)) (:background "#282828" :foreground "#fdf4c1")) (((class color) (min-colors 255)) (:background "#262626" :foreground "#ffffaf")))))

(setq use-package-always-ensure t)
(use-package magit)
(use-package evil)
(use-package gruvbox-theme)
(use-package flycheck)
(use-package ranger)
(use-package company)

(add-hook 'after-init-hook 'global-company-mode)
(evil-mode 1)
(load-theme 'gruvbox-dark-hard t)
(let ((frame-background-mode 'light)) (frame-set-background-mode nil))
(if (eq system-type 'windows-nt)
    (set-frame-font "Consolas Bold 12" nil t)
(set-frame-font "Dejavu Sans Mono Bold 11" nil t))
(global-linum-mode t)
(savehist-mode 1)
(setq x-select-enable-clipboard t)
(global-set-key (kbd "<f7>") 'ranger)
