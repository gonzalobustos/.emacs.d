(require 'ag)
(require 'wgrep-ag)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)

(setq-default grep-highlight-matches t
              grep-scroll-output t)

(setq-default ag-highlight-search t)
(setq-default ag-reuse-window nil)
(setq-default ag-reuse-buffers t)

(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

(provide 'init-grep)