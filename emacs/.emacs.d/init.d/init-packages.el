(require 'package)
(setq package-enable-at-startup nil)
(if (getenv "http_proxy")
    ;; Use local mirror
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

(use-package auctex
  :defer t
  :ensure t
  :hook
  (LaTeX-mode . (lambda()
                  (auto-fill-mode 1)
                  (setq fill-column 80)))
  :init
  ;; https://stackoverflow.com/questions/9534239/emacs-auctex-latex-syntax-prevents-monospaced-font
  ;; Only change sectioning color
  (setq font-latex-fontify-sectioning 'color)
  ;; super-/sub-script on baseline
  (setq font-latex-script-display (quote (nil)))
  ;; Do not change super-/sub-script font
  (custom-set-faces
   '(font-latex-subscript-face ((t nil)))
   '(font-latex-superscript-face ((t nil))))
  ;; Exclude bold/italic from keywords
  (setq font-latex-deactivated-keyword-classes
        '("italic-command" "bold-command" "italic-declaration" "bold-declaration")))

(use-package clang-format
  :hook
  ((c-mode c++-mode) . (lambda()  (fset 'format-code 'clang-format-region))))

(use-package cmake-mode)

(use-package column-enforce-mode
  :config
  (global-column-enforce-mode t))

(use-package company
  :config
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-modes t)
  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-code-ignore-case t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)
  (setq company-dabbrev-other-buffers 'all)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  :hook
  ((c-mode c++-mode) . (lambda ()
			 (set (make-local-variable 'company-backends)
			      '((company-gtags company-dabbrev-code)))))
  :init
  (global-company-mode))

(use-package counsel
  :bind
  ("C-c c g" . counsel-ag)
  ;; Files browsing
  ("C-c e" . counsel-find-file)
  ("M-x" . counsel-M-x)
  ("C-c r" . counsel-recentf))

(use-package counsel-gtags)

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package elpy
  :after python
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
  ((c++-mode gn-mode LaTeX-mode). (lambda () (setq evil-shift-width 2))))

(use-package evil-leader
  :config
  (evil-leader/set-key
    "h" 'evil-window-left
    "j" 'evil-window-down
    "k" 'evil-window-up
    "l" 'evil-window-right
    "f" 'format-code)
  (evil-leader/set-leader "<SPC>")
  (global-evil-leader-mode))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode))

(use-package fill-column-indicator
  :config
  ;; Temporary fix for line height change abnormally.
  (setq  fci-always-use-textual-rule t)
  (defun on-off-fci-before-company(command)
    (when (string= "show" command)
      (turn-off-fci-mode))
    (when (string= "hide" command)
      (turn-on-fci-mode)))
  (advice-add 'company-call-frontends :before #'on-off-fci-before-company)
  :hook ((c++-mode LaTeX-mode) . (lambda ()
                                   (fci-mode)
                                   (setq fci-rule-column 80))))

(use-package flx)

(use-package flycheck)

(use-package flyspell-correct-ivy
  :config
  (setq flyspell-issue-message-flag nil)
  (define-key flyspell-mode-map (kbd "C-c i c") 'flyspell-correct-wrapper))

(use-package flyspell-lazy
  :config
  (setq flyspell-lazy-idle-seconds 1)
  (flyspell-lazy-mode 1))

(use-package ggtags)

(use-package ispell
  :after (flyspell-lazy)
  :hook
  (prog-mode . flyspell-prog-mode)
  (text-mode . flyspell-mode)
  :init
  (setq ispell-dictionary "en_US")
  (if (eq system-type 'windows-nt)
      (setq ispell-program-name (expand-file-name "~/myconfig/windows/hunspell/bin/hunspell.exe"))
    (setq ispell-program-name (executable-find "hunspell")))
  (setq ispell-really-hunspell t)
  (setq ispell-local-dictionary-alist
        '((nil
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_US" "-i" "utf-8")
           nil
           utf-8)
          ("en_US"
           "[[:alpha:]]"
           "[^[:alpha:]]"
           "[']"
           t
           ("-d" "en_US")
           nil
           utf-8)
          ("de_DE_frami"
           "[[:alpha:]ÄÖÜéäöüß]"
           "[^[:alpha:]ÄÖÜéäöüß]"
           "[']"
           t
           ("-d" "de_DE_frami")
           nil
           utf-8)
          ("fr"
           "[[:alpha:]ÀÂÇÈÉÊËÎÏÔÙÛÜàâçèéêëîïôùûü]"
           "[^[:alpha:]ÀÂÇÈÉÊËÎÏÔÙÛÜàâçèéêëîïôùûü]"
           "[-']"
           t
           ("-d" "fr-classique")
           nil
           utf-8))))

(use-package ivy
  :bind
  ("C-c l" . ivy-switch-buffer)
  :config
  (ivy-mode 1)
  (setq enable-recursive-minibuffers t)
  (setq ivy-use-virtual-buffers t))

(use-package json-mode
  :hook
  (json-mode . (lambda()  (fset 'format-code 'json-reformat-region))))

(use-package lua-mode)

(use-package magit
  :bind
  ("C-c m d" . magit-diff-buffer-file)
  ("C-c m s" . magit-status)
  ("C-c m m n" . smerge-next)
  ("C-c m m p" . smerge-prev)
  :config
  (setq git-commit-summary-max-length 100)
  (setq fill-column -1))

(use-package evil-magit)

(use-package nlinum
  :config
  (global-nlinum-mode))

(use-package org
  :config
  (setq org-log-done 'time))

(use-package projectile
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
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
  ("C-c f" . swiper))

(use-package web-beautify
  :hook
  ((js2-mode js-mode json-mode) . (lambda()  (fset 'format-code 'web-beautify-js)))
  (sgml-mode . (lambda()  (fset 'format-code 'web-beautify-html)))
  (css-mode . (lambda()  (fset 'format-code 'web-beautify-css))))

(use-package yascroll
  :config
  (global-yascroll-bar-mode 1)
  (setq yascroll:delay-to-hide nil))

(provide 'init-packages)
