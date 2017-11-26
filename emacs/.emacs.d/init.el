(package-initialize)

(add-to-list 'load-path (expand-file-name "init.d" user-emacs-directory))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(require 'init-functions)
(require 'init-packages)
(require 'init-general)

(if (eq system-type 'windows-nt)
  (require 'init-windows)
  (require 'init-nix))

(provide 'init)
