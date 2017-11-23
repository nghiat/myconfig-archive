(package-initialize)

(add-to-list 'load-path (expand-file-name "init.d" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-packages)
(require 'init-company)
(require 'init-evil)
(require 'init-evil-commentary)
(require 'init-flycheck)
(require 'init-general)
(require 'init-ranger)
(require 'init-spaceline)
(require 'init-irony)

(if (eq system-type 'windows-nt)
  (require 'init-windows)
  (require 'init-nix))

(provide 'init)
