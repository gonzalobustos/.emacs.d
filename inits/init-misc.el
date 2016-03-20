(setq-default
  make-backup-files nil
  create-lockfiles nil
	tab-width 2
	indent-tabs-mode nil)

(setq standard-indent 2)

(show-paren-mode t)

(delete-selection-mode t)

(global-undo-tree-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-misc)
