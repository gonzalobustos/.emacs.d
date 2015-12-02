(require 'ag)
(require 'wgrep-ag)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)

(setq
	grep-highlight-matches t
	grep-scroll-output t
	ag-highlight-search t
	ag-reuse-window t
	ag-reuse-buffers t)

(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

(provide 'init-grep)