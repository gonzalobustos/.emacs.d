(defun open-notes-file ()
  (interactive)
  (find-file org-default-notes-file))

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if 
  there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
      (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

(defun reindent-buffer ()
  "Reindent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun reindent-region-or-buffer ()
  "Reindent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
      (progn
        (indent-region (region-beginning) (region-end))
        (message "Reindented selected region."))
      (progn
        (reindent-buffer)
        (message "Reindented buffer.")))))

(defun shift-region (distance)
  "Shift the selected region right if distance is postive, 
  left if negative"
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      (setq deactivate-mark nil))))

(defun shift-right ()
  "Move the selected text one column to the right"
  (interactive)
  (shift-region 1))

(defun shift-left ()
  "Move the selected text one column to the left"
  (interactive)
  (shift-region -1))

(defun move-text (arg)
  "Move the selected text one"
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          (when (and (eval-when-compile
                       '(and (>= emacs-major-version 24)
                             (>= emacs-minor-version 3)))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text arg))

(defun move-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text (- arg)))

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active. With argument 
  N, make N copies. With negative N, comment out original 
  line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1))
                          (newline))))))
        (dotimes (i (abs (or n 1)))
          (insert text))))
    (if use-region nil                 
      (let ((pos (- (point) (line-beginning-position)))) 
        (if (> 0 n)                           
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

(defun prev-window ()
  "Go to the previous window."
  (interactive)
  (other-window -1))

(provide 'init-utils)