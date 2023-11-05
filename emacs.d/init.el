(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))


;; Projectile
(require 'projectile)
(projectile-mode +1)

(global-set-key (kbd "C-a C-a") 'projectile-command-map)

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


(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/auto-saves/") t)))
