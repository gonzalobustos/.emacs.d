(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))

(setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)

(provide 'init-flycheck)