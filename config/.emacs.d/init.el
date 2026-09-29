;;-------------------- Directorio para backups --------------------
(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory))))

;;-------------------- Directorio para archivos de auto-save --------------------
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "autosaves/" user-emacs-directory) t)))

;; Crear los directorios si no existen
(make-directory
 (expand-file-name "backups/" user-emacs-directory)
 t)

(make-directory
 (expand-file-name "autosaves/" user-emacs-directory)
 t)

;; Italic color gris en comentarios
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:slant italic :foreground "gray50")))))


;;-------------------- Melpa --------------------
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))



;;-------------------- batpuccin --------------------
(use-package batppuccin
  :vc (:url "https://github.com/bbatsov/batppuccin-emacs" :rev :newest)
  :config
  (load-theme 'batppuccin-mocha t))


;;-------------------- Corfu --------------------
;; 1. Motor de filtrado (imprescindible para Eglot + Corfu)
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; 2. Configuración de Corfu
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)                 ; Mostrar sugerencias automáticamente
  (corfu-auto-delay 0.1)         ; Retraso mínimo al escribir
  (corfu-auto-prefix 1)          ; Mostrar sugerencias desde la 1ª letra
  (corfu-cycle t)                ; Permitir navegar cíclicamente con Tab/Arrow
  :config
  (global-corfu-mode))           ; Carga el modo global una vez instanciado corfu

;; 3. Integración con Eglot
(use-package cape
  :ensure t
  :init
  ;; Añadir fuentes de autocompletado estándar
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file))

(setopt tab-always-indent 'complete)

;; corfu para terminal
(use-package corfu-terminal
  :ensure t
  :config
  (corfu-terminal-mode +1))


;; eglot
(require 'eglot)

(add-to-list 'eglot-server-programs
             '(csharp-mode . ("roslyn-language-server" "--stdio")))

(setq eglot-send-changes-idle-time 1.0)
(setq flymake-no-changes-timeout 1.0)
(setq eglot-ignored-server-capabilities
      '(:hoverProvider
        :signatureHelpProvider
        :documentHighlightProvider
        :inlayHintProvider))
(add-hook 'csharp-mode-hook #'eglot-ensure)


;;patch
(setenv "PATH"
        (concat (getenv "PATH")
                ":" (expand-file-name "~/.dotnet/tools")))

(add-to-list 'exec-path
             (expand-file-name "~/.dotnet/tools"))
