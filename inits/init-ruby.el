(require 'rbenv)
(require 'robe)
(require 'rspec-mode)
(require 'rubocop)
(require 'ruby-mode)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'rubocop-mode)

(with-eval-after-load "company"
  '(push 'company-robe company-backends))

(setq rbenv-show-active-ruby-in-modeline nil)

(global-rbenv-mode)

(provide 'init-ruby)