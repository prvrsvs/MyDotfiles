
;;; treemacs-config.el --- Treemacs with Nerd Icons

;; File tree
(use-package treemacs
  :ensure t
  :defer nil
  :bind
  (("C-x /" . treemacs)
   ("M-0" . treemacs-select-window)))
:config
(setq treemacs-width 35)
(setq treemacs-width-is-initially-locked nil)
(setq treemacs-collapse-dirs 3)
(setq treemacs-indentation 2)
(setq treemacs-indentation-string " ")
(setq treemacs-display-in-side-window t)
(setq treemacs-is-never-other-window t)
(setq delete-by-moving-to-trash t)
(setq treemacs-move-files-by-mouse-dragging nil)
(setq treemacs-git-mode 'deferred)
(setq treemacs-git-commit-diff-mode 1)
(setq treemacs-deferred-git-apply-delay 0)
(treemacs-project-follow-mode 1)
(treemacs-filewatch-mode 1)
(treemacs-hide-gitignored-files-mode -1)

;; (defun treemacs-ignore-gitignore (file _)
;;     (string= file "__pycache__"))
;;   (push #'treemacs-ignore-gitignore treemacs-ignored-file-predicates))

;;Nerd Fonts icon library
(use-package nerd-icons
  :ensure t
  :defer t)

;; Nerd Icons theme for Treemacs
(use-package treemacs-nerd-icons
  :after nerd-icons
  :defer nil
  :config
  (treemacs-load-theme "nerd-icons"))

(with-eval-after-load 'treemacs
  (custom-set-faces
   '(treemacs-git-untracked-face
     ((t (:foreground "#6c7086"))))))

(provide 'treemacs)
;;; treemacs-config.el ends here

