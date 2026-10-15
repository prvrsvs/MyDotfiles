;; Backups and autosaves config file.


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

(setq auto-save-default t)
(setq auto-save-timeout 20)       ; Guarda automáticamente tras 20 segundos de inactividad
(setq auto-save-interval 200) ; Guarda cada 200 pulsaciones de tecla


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

(setq auto-save-default t)
(setq auto-save-timeout 20)       ; Guarda automáticamente tras 20 segundos de inactividad
(setq auto-save-interval 200) ; Guarda cada 200 pulsaciones de tecla

(provide 'backups)
