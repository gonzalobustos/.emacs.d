(require 'go-eldoc)

(add-to-list 'load-path "$GOPATH/src/github.com/dougm/goflymake")

(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

(add-hook 'go-mode-hook '(lambda ()
  (go-oracle-mode)
  (setq compile-command "go build -v && go test -v && go vet")
  (local-set-key (kbd "C-c C-c") 'compile)
  (local-set-key (kbd "C-c C-j") 'godef-jump)
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
  (local-set-key (kbd "C-c C-i") 'go-goto-imports)
  (local-set-key (kbd "C-c C-f") 'gofmt)
  (local-set-key (kbd "C-c C-d") 'godoc)
  (add-hook 'before-save-hook 'gofmt-before-save)))

(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)))

(add-hook 'go-mode-hook 'go-eldoc-setup)

(provide 'init-go)