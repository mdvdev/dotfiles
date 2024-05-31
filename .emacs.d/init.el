;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Add Use-package to the list
(setq package-list
      '(use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Install use-package
; activate all the packages
(package-initialize)

;; Enable Scheme
(set-variable 'scheme-program-name "csi -:c")

;; Disable annoying bell sound
(setq ring-bell-function 'ignore)
(setq visible-bell t)
(setq ring-bell-nsound 0)

;; Disable GUI bars
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Change font size
(set-face-attribute 'default nil :height 140)

;; Disable file backup
(setq make-backup-files nil)

;; Set type of line numbering (global variable)
(setq display-line-numbers-type 'relative)

;; Activate line numbering in all buffers/modes
(global-display-line-numbers-mode)

;; C/C++ config
(setq c-default-style "stroustrup"
      c-basic-offset 4)

;; Convert tabs to spaces in autoidentation
(setq indent-tabs-mode nil)

;; Default emacs window size
(add-to-list 'default-frame-alist '(width . 110))
(add-to-list 'default-frame-alist '(height . 45))

;; Download paredit
(use-package paredit
  :ensure t)

;; Download company
(use-package company
  :ensure t
  :config
  (add-hook 'with-eval-after-load 'global-company-mode))

;; Download LSP
(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1))  ;; clangd is fast

;; Download LSP-UI
(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :custom
  (lsp-ui-doc-show-with-cursor t))
  ;;(setq lsp-ui-sideline-enable nil))

;; Download projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config
  (projectile-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Download helm-projectile
(use-package helm-projectile
  :ensure t
  :config
   (helm-projectile-on))

;; Download flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; Download undo-tree
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history nil))

;; Download helm-ag
(use-package helm-ag
  :ensure t)

;; Download Evil
(use-package evil
  :ensure t)

;; Enable Evil
;;(require 'evil)
;;(evil-mode 1)

;; Download vterm
(use-package vterm
  :ensure t)

;; Donwload magit
(use-package magit
  :ensure t)

;; Download kaolin-theme
(use-package kaolin-themes
  :ensure t)

;; Download zenburn theme
(use-package zenburn-theme
  :ensure t)

;; Download modus themes
(use-package modus-themes
  :ensure t)

;; Download leuven theme
(use-package leuven-theme
  :ensure t)

;; Download CIDER for clojure support
(use-package cider
  :ensure t)

;; Download clojure-mode
(use-package clojure-mode
  :ensure t)

;; Download vertico
(use-package vertico
  :ensure t)

;; Download consult
(use-package consult
  :ensure t)

;; Language translator
(use-package go-translate
  :ensure t
  :config
  (setq gts-translate-list '(("ru" "en")))
  (setq gts-default-translator
        (gts-translator
         :picker (gts-prompt-picker)
         :engines (list (gts-bing-engine) (gts-google-engine))
         :render (gts-buffer-render))))

;; Download orderless
(use-package orderless
  :ensure t)

;; Download csv-mode
(use-package csv-mode
  :ensure t)

;; go-translator alias
(defun translate ()
  (interactive)
  (gts-do-translate))

;; Setup GDB
(setq
 ;; Use gdb-many-windows by default
 gdb-many-windows t
 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
)

;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)

;; Custom path
(add-to-list 'load-path "~/.emacs.d/custom")

;; consult and vertico config files
(require 'consult-conf)
(require 'vertico-conf)

;; Boost company+lsp performance
(defun baal-setup-lsp-company ()
  (setq-local company-backends
              '(company-capf company-dabbrev company-dabbrev-code)))

(add-hook 'lsp-completion-mode-hook #'baal-setup-lsp-company)

(setq company-idle-delay 0.35 ;; How long to wait before popping up
      company-minimum-prefix-length 2 ;; Show the menu after one key press
      company-tooltip-limit 15 ;; Limit on how many options to display
      company-show-quick-access t ;; Show numbers behind options
      company-tooltip-align-annotations t ;; Align annotations to the right
      company-require-match nil           ;; Allow free typing
      company-selection-wrap-around t ;; Wrap around to beginning when you hit bottom of suggestions
      company-dabbrev-ignore-case t ;; Don't ignore case when completing
      company-dabbrev-downcase t ;; Don't automatically downcase completions
      )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(c-basic-offset 4 t)
 '(c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "k&r")) t)
 '(column-number-mode t)
 '(custom-enabled-themes '(kaolin-dark ef-kassio))
 '(custom-safe-themes
   '("917d7e7f0483dc90a5e2791db980ce9bc39e109a29198c6e9bdcd3d88a200c33" "74e2ed63173b47d6dc9a82a9a8a6a9048d89760df18bc7033c5f91ff4d083e37" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "524fa911b70d6b94d71585c9f0c5966fe85fb3a9ddd635362bfabd1a7981a307" "ca47f7b222eb380e3035fb594d52032acd89dae0a49eac3da722a5cd3f485e3b" "b216e9b72dc8c2b702e4fcfd3c0af2d73c87eba46fd4db824ddb50863447d6a9" "0cb6dc28758f1173709003cc65b6ee8553297548c69e094385cc4c25f6357c5b" "50d388e646c2c19b0fa60a229e6536760f757863b0fc3c193405e0499446ecaf" "9f27d5afd6d78b40bf1290c10722818e0b90f141fc3758d3c2d284ccb565de15" "ed1b7b4db911724b2767d4b6ad240f5f238a6c07e98fff8823debcfb2f7d820a" "3bfdc037f4e076a4afe8060a7e663a75eb2f3a5bedf1c9902a5d5645fba08d56" "c6f78f6a0324b541082bfcc7e1672d1b760b147ec2a09a37dbd469235ced473b" "24cfd7c82a9278b966f21a659ce805d5b6399655c0a39de813fd0fb6ee8b2d5c" "0d9028987183602b113c27e52e549b2eeb23fb29ebfc19ca0b6612fa57472066" "82f1e895a3fb1f4b99efc81e9d732c850f55653689e9492b4eb1be292b4826c3" "159a29ab0ec5ba4e2811eddd9756aa779b23467723dcbdd223929fbf2dde8954" "0664443859604a53d2257701f034459edf8eab3cc2be50c7d8ae36740fe35578" "515ebca406da3e759f073bf2e4c8a88f8e8979ad0fdaba65ebde2edafc3f928c" "943f5fc368a959c5858ff466401357da25b5991c0eeb396e865fd8071e8fe88e" "7af2a6fcd1e743d165c58fd95d20b46c2d96d9873ab67fc9371bdc8fda463de7" "702d0136433ca65a7aaf7cc8366bd75e983fe02f6e572233230a528f25516f7e" "23841f54afd15fe850da8b37f2bb5813a873f53ed528024b0becb486ad8b01b3" "f42ea77c304f98f13ce4ed3b7b84d4a96c69e651757185ba26aa7059d3219051" "694dbeb8f98dddfb603a2fe0c04101f3fe457ee49bf90a6a581271e7f9c580c8" "95e934b092694a2624adb653043d1dc016a6712fa27b788f9ff4dffb8ee08290" "7776ba149258df15039b1f0aba4b180d95069b2589bc7d6570a833f05fdf7b6d" "0c5d7ffa7cdf8b889342d2cd38f6ddd2cc716561048feca89b17fda56677d6b8" "e8480a7c0fcd73c430111858550dfb91326df654ccbe038485ba87158320595d" "f3781be0be23cc71c89b317489e07a4ad3e885f84c0a618692b53bbd69e60843" "0cf95236abcf59e05b1ea69b4edd53d293a5baec4fe4c3484543fee99bfd2204" "18cf5d20a45ea1dff2e2ffd6fbcd15082f9aa9705011a3929e77129a971d1cb3" "c1638a7061fb86be5b4347c11ccf274354c5998d52e6d8386e997b862773d1d2" "703a3469ae4d2a83fd5648cac0058d57ca215d0fea7541fb852205e4fae94983" "c7a926ad0e1ca4272c90fce2e1ffa7760494083356f6bb6d72481b879afce1f2" "0f76f9e0af168197f4798aba5c5ef18e07c926f4e7676b95f2a13771355ce850" "64045b3416d83e5eac0718e236b445b2b3af02ff5bcd228e9178088352344a92" "cb8eb6d80c3908a53b0c8a98ab0cedd007c1f10593a5f0f1e2ee24eec241e3e0" "bbfccff82c1d35611cdf25339401a483875b32472fae7fcdaf14bd12c3a05b07" "b29ba9bfdb34d71ecf3322951425a73d825fb2c002434282d2e0e8c44fce8185" default))
 '(evil-undo-system 'undo-redo)
 '(indent-tabs-mode nil)
 '(line-number-mode t)
 '(lsp-completion-enable-additional-text-edit nil)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-ui-sideline-show-diagnostics t)
 '(menu-bar-mode nil)
 '(org-agenda-files '("/home/ana/file.org"))
 '(package-selected-packages
   '(nyan-mode kaolin-theme latex-preview-pane-mode csv-mode orderless go-translate helm-ag undo-tree helm-projectile lsp-ui cider ansi-term gnu-elpa-keyring-update magit vterm evil))
 '(recentf-mode t)
 '(tab-bar-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
