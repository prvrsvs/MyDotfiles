;;; clipboard.el --- System clipboard integration for Emacs

(defun my-copy-to-clipboard ()
  "Copy current kill to the Wayland clipboard."
  (when (and (executable-find "wl-copy")
             (car kill-ring))
    (with-temp-buffer
      (insert (car kill-ring))
      (call-process-region (point-min) (point-max)
                           "wl-copy" nil 0))))

(advice-add 'kill-new :after
            (lambda (&rest _)
              (my-copy-to-clipboard)))


(provide 'clipboard)
