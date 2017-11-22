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
    (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("org"   . "http://marmalade-repo.org/packages/")
                         ("gnu"   . "http://elpa.gnu.org/packages/"))))
(package-initialize)
;; Install 'use-package' if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable use-package
(eval-when-compile (require 'use-package))
(setq use-package-always-ensure t)

(use-package magit)
(use-package evil)
(use-package gruvbox-theme)
(use-package flycheck)
(use-package ranger)
(use-package company)
(use-package spaceline)
(use-package evil-commentary)
(use-package company-irony)
(use-package irony-mode)

(provide 'init-packages)

