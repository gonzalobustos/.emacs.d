;; org
(global-set-key (kbd "C-c n f") 'open-notes-file)

;; windows and frames
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; multiple-cursors
(global-set-key (kbd "C-c m e") 'mc/edit-lines)
(global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)

;; comments
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region-or-line)

;; find
(global-set-key (kbd "C-c f p") 'ag-project-regexp)
(global-set-key (kbd "C-c f d") 'ag-regexp)

;; search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; replace
(global-set-key (kbd "C-c r r") 'replace-regexp)
(global-set-key (kbd "C-c q r") 'query-replace-regexp)

;; kill-ring
(global-set-key (kbd "M-Y") 'browse-kill-ring)

;; indentation
(global-set-key (kbd "C-c r i") 'reindent-region-or-buffer)

;; moving text
(global-set-key (kbd "C-S-<up>") 'move-up)
(global-set-key (kbd "C-S-<down>") 'move-down)
(global-set-key (kbd "C-S-<left>") 'shift-left)
(global-set-key (kbd "C-S-<right>") 'shift-right)

;; duplication
(global-set-key (kbd "C-c d") 'duplicate-line-or-region)

;; org
(global-set-key (kbd "C-c o l") 'org-store-link)
(global-set-key (kbd "C-c o a") 'org-agenda)
(global-set-key (kbd "C-c o c") 'org-capture)

;; project
(global-set-key (kbd "C-c n t") 'neotree-toggle)

(provide 'init-keybindings)