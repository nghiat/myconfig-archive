;; https://www.reddit.com/r/emacs/comments/3kqt6e/2_easy_little_known_steps_to_speed_up_emacs_start/
(defvar file-name-handler-alist-old file-name-handler-alist)

;; These config will be restored to the default values after-init-hook
(setq package-enable-at-startup nil
      file-name-handler-alist nil
      message-log-max 16384
      gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(require 'package)
(if (getenv "http_proxy")
    ;; Use local mirror
    (progn
      (unless (file-directory-p "~/.emacs.d/mirror-elpa")
	((let ((default-directory "~/.emacs.d"))
           (shell-command-to-string "git clone https://github.com/d12frosted/elpa-mirror"))))
      (setq package-archives '(("melpa" . "~/.emacs.d/mirror-elpa/melpa/")
                               ("gnu"   . "~/.emacs.d/mirror-elpa/gnu/"))))
  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
                           ("gnu"   . "https://elpa.gnu.org/packages/"))))

;; Install 'use-package' if necessary
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(use-package auctex
  :mode ("\\.tex\\'" . TeX-latex-mode)
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

(use-package cmake-mode
  :mode ("CMakeLists.txt" "\\.cmake\\'"))

(use-package column-enforce-mode
  :defer 5
  :config
  (global-column-enforce-mode t))

(use-package company
  :defer 5
  :config
  (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case nil)
  (setq company-dabbrev-other-buffers 'all)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (setq company-backends '(company-dabbrev))
  :hook
  (after-init . (lambda () (global-company-mode))))

(use-package counsel
  :bind
  ("C-c c g" . counsel-ag)
  ;; Files browsing
  ("C-c e" . counsel-find-file)
  ("M-x" . counsel-M-x)
  ("C-c r" . counsel-recentf)
  :config
  (use-package flx)
  (use-package smex
    :config
    (smex-initialize)))


(use-package counsel-gtags
  :commands
  (counsel-gtags-dwim
   counsel-gtags-find-file
   counsel-gtags-find-symbol
   counsel-gtags-find-reference
   counsel-gtags-find-definition))

(use-package evil
  :config
  (evil-mode 1)
  (fset 'evil-visual-update-x-selection 'ignore)
  (setq evil-symbol-word-search t)
  (setq evil-want-fine-undo t)
  :hook
  ((c++-mode gn-mode LaTeX-mode). (lambda () (setq evil-shift-width 2))))

(use-package evil-leader
  :after evil
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
  (setq fci-always-use-textual-rule t)
  (defun on-off-fci-before-company(command)
    (when (string= "show" command)
      (turn-off-fci-mode))
    (when (string= "hide" command)
      (turn-on-fci-mode)))
  (advice-add 'company-call-frontends :before #'on-off-fci-before-company)
  :hook ((c++-mode LaTeX-mode) . (lambda ()
                                   (fci-mode)
                                   (setq fci-rule-column 80))))

(use-package flyspell-correct-ivy
  :defer 5
  :config
  (setq flyspell-issue-message-flag nil)
  (define-key flyspell-mode-map (kbd "C-c i c") 'flyspell-correct-wrapper))

(use-package flyspell-lazy
  :config
  (setq flyspell-lazy-idle-seconds 1)
  (flyspell-lazy-mode 1))

(use-package ggtags
  :disabled t
  :commands ggtags-mode)

(use-package gn-mode
  :load-path "init.d"
  :mode ("BUILD.gn" "\\.gni\\'"))

(use-package ispell
  :no-require t
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
  :mode "\\.json\\'"
  :hook
  (json-mode . (lambda()  (fset 'format-code 'json-reformat-region))))

(use-package lua-mode
  :mode "\\.lua\\'"
  :interpreter "lua")

(use-package magit
  :bind
  ("C-c m d" . magit-diff-buffer-file)
  ("C-c m s" . magit-status)
  ("C-c m m n" . smerge-next)
  ("C-c m m p" . smerge-prev)
  :config
  (use-package evil-magit))

(use-package nlinum
  :config
  (global-nlinum-mode))

(use-package projectile
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (projectile-mode)
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  (use-package counsel-projectile
    :config
    (counsel-projectile-mode)))

(use-package qml-mode
  :mode "\\.qml\\'"
  :config
  (autoload 'qml-mode "qml-mode" "Editing Qt Declarative." t))

(use-package ranger
  :bind ("<f7>" . ranger))

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

;; Restore to the default values.
(add-hook 'after-init-hook
          `(lambda ()
             (setq file-name-handler-alist file-name-handler-alist-old
                   gc-cons-threshold 800000
                   gc-cons-percentage 0.1)
             (garbage-collect)) t)

(provide 'init-packages)
