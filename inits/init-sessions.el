(setq 
  desktop-path (list user-emacs-directory)
  desktop-auto-save-timeout 600)

(desktop-save-mode 1)

(setq-default history-length 1000)
(savehist-mode t)

(provide 'init-sessions)