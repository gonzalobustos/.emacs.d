(if (eq system-type 'darwin)
    (require 'cask "/usr/local/share/emacs/site-lisp/cask.el")
  (require 'cask "~/.cask/cask.el"))

(cask-initialize)

(require 'pallet)
(pallet-mode t)

(provide 'init-cask)