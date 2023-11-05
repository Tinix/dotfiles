
(require 'package)
; (add-to-list 'package-archives
;              '(("gnu" . "https://elpa.gnu.org/packages/")
;               '("melpa" . "https://melpa.org/packages/") t)
;                ("org" . "https://orgmode.org/elpa/")))

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(multiple-cursors magit comment-dwim-2 ivy-fuz fzf all-the-icons-nerd-fonts treemacs-all-the-icons treemacs-icons-dired treemacs-evil projectile-rails zeal-at-point ido-exit-target cmake-mode vterm evil-dvorak web-mode helm-robe robe rust-mode eshell-z exec-path-from-shell go-mode enh-ruby-mode counsel projectile helm treemacs evil gruvbox-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Load gruvbox theme
(load-theme 'gruvbox t)


(require 'evil)
(evil-mode 1)

;; Helm
(require 'helm)
(helm-mode 1)

;; Projectile
(global-set-key (kbd "C-p") 'projectile-command-map)

(require 'counsel)
(counsel-mode)

(global-set-key (kbd "C-c C-c") 'counsel-M-x)

;; Ruby & Rails config
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . web-mode))
(setq web-mode-engines-alist
      '(("erb" . "\\.html\\.erb\\'")))


(defalias 'deja-cortar 'cua-mode)
(defalias 'desmarcamelo 'hl-line-mode)
(defalias 'instalar-paquetes 'package-list-packages)
;;********************************************************************


;; Set number line
(global-linum-mode t)

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
					 'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)


;; F-1 Open file
(global-set-key [f1]    'find-file)
;; F-2 Save 
(global-set-key [f2]  'save-buffer)
;; Transport line
(global-set-key [f4] 'transpose-lines)
;; F5 - Circula por los buffers abiertos
(global-set-key [f5] 'bury-buffer)
;; F6 - Otro forma de circular por los buffers
(global-set-key [f6] 'kill-buffer)
;; Split vertical
;;(global-set-key [f8]  'split-window-vertically)



;; Apaga el mensaje de inicio de Emacs
(setq inhibit-startup-message t);

;; Inicio automático en modo texto

(setq default-major-mode 'text-mode)


;; Barra con menu -- Tool bar disable //desactivada 
;;To disable the menu bar
(menu-bar-mode -1) 
;;To disable the scrollbar
(toggle-scroll-bar -1) 
;;To disable the toolbar
(tool-bar-mode -1) 


;; Projectile
(require 'projectile)
(projectile-mode +1)

(global-set-key (kbd "C-a") 'projectile-command-map)

;; Ruby config syntax
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb\\'" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))


;; Go config
(require 'go-mode)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Rust config
(require 'rust-mode)
(setq rust-cargo-bin "cargo")

;; Hidden menu bar
(menu-bar-mode -1)

;; Evil-dvorak mode config
(require 'evil)
(evil-mode 1)
(require 'evil-dvorak)
(evil-dvorak-mode 1)

;; Configuración para teclado Dvorak
(setq default-input-method "dvorak")



;; Personalizar atajos de teclado para Evil mode en Dvorak
(evil-define-key 'normal global-map (kbd "h") 'evil-backward-char)
(evil-define-key 'normal global-map (kbd "t") 'evil-next-visual-line)
(evil-define-key 'normal global-map (kbd "n") 'evil-previous-visual-line)
(evil-define-key 'normal global-map (kbd "s") 'evil-forward-char)


(unless (package-installed-p 'neotree)
  (package-refresh-contents)
  (package-install 'neotree))

(require 'neotree)
;; Personaliza las teclas de acceso rápido si lo deseas
(global-set-key [f8] 'neotree-toogle)

;; Config kbd comment
(global-set-key (kbd "M-;") 'comment-region)
(global-set-key (kbd "M-q") 'uncomment-region)

;; do not save files with ~ and #files.go#
(setq make-backup-files nil)
(setq create-lockfiles nil)


;; cursor I-Beam
(setq-default cursor-type 'bar)
(add-hook 'text-mode-hook (lambda () (setq cursor-type 'bar)))
