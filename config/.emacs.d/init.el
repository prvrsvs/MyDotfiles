;; init.el --- Emacs initialization file

; Directorio principal de la configuración
(defvar config-dir
  (expand-file-name "config" user-emacs-directory))

;; Shell 
(setq shell-file-name "/bin/zsh"
      explicit-shell-file-name "/bin/zsh")

;; path and .net tools
(let ((dotnet-tools (expand-file-name "~/.dotnet/tools")))
  (setenv "PATH"
          (concat (getenv "PATH") path-separator dotnet-tools))
  (add-to-list 'exec-path dotnet-tools))

(add-to-list 'load-path config-dir)

(load (expand-file-name "core/clipboard" config-dir))
(load (expand-file-name "core/packages" config-dir))

(load (expand-file-name "tools/backups" config-dir))
(load (expand-file-name "tools/treemacs" config-dir))

(load (expand-file-name "ui/linenumber" config-dir))
(load (expand-file-name "ui/theme" config-dir))
(load (expand-file-name "ui/dashboard" config-dir))

(load (expand-file-name "completion/corfu" config-dir))

(load (expand-file-name "programming/eglot" config-dir))


;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic :foreground "gray50")))))
