;; config/dashboard.el

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  
  ;; Configuración del dashboard
  (setq dashboard-startup-banner "~/Downloads/XD.jpg")
  
  ;; AJUSTAR TAMAÑO DE LA IMAGEN
  (setq dashboard-image-banner-max-height 200)  ; Altura máxima en píxeles
  (setq dashboard-image-banner-max-width 400)   ; Ancho máximo en píxeles
  
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons nil)
  (setq dashboard-set-file-icons nil)
  
  ;; Elementos a mostrar
  (setq dashboard-items '((recents  . 10)
                          (bookmarks . 5)))
  
  ;; Texto del banner
  (setq dashboard-banner-logo-title "JoseSusuya")
  
  ;; Footer
  (setq dashboard-footer-messages '("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"))
  
  ;; Iniciar en el dashboard
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))))
