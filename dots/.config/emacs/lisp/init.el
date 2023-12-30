;;; lisp/init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;
;; :core is now treated like a normal module, and this is its (temporary) init
;; file, which will be removed once we've resolved our `use-package' dependency
;; (which will soon be moved to its own module), then these will be returned to
;; the profile init file.
;;
;;; Code:

(doom-require 'doom-keybinds)
(doom-require 'doom-ui)
(doom-require 'doom-projects)
(doom-require 'doom-editor)

;; Nix Mode is needed
(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'"))
(use-package nix-drv-mode
  :ensure nix-mode
  :mode "\\.drv\\'")
(use-package nix-shell
  :ensure nix-mode
  :commands (nix-shell-unpack nix-shell-configure nix-shell-build))
(use-package nix-repl
  :ensure nix-mode
  :commands (nix-repl))



;;; init.el ends here
