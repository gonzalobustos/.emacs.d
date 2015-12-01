(setq-default
  make-backup-files nil
  create-lockfiles nil
	tab-width 2
	indent-tabs-mode nil)

(show-paren-mode 1)

(global-undo-tree-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-misc)