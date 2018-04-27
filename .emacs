;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;;LINENUM
(global-linum-mode t)
(tool-bar-mode 0)
(menu-bar-mode 0)

;;IDO
(require 'ido)
(ido-mode t)

;;DIABLEING BACKUP FILE
(setq make-backup-files nil)

;;启动窗口大小,MENU_BAR,TOOL_BAR
(setq default-frame-alist
      '((height . 55) (width . 200) (alpha . 100)))


;; show parenthese
(show-paren-mode t)

;; color-theme
(add-to-list 'load-path "~/emacs_conf/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-goldenrod)))

;;mac META SUPER
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;DIABLEING BACKUP FILE
(setq make-backup-files nil)

;; PRELUDE INIT
;; (load "~/.emacs.d/init.el")

;; zxtree init
(load "~/emacs_conf/init.el")
(setq custom_emacs_dir "~/emacs_conf/zxtree/")
(add-to-list 'load-path custom_emacs_dir)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zop-to-char zenburn-theme which-key volatile-highlights vkill undo-tree smartrep smartparens smart-mode-line projectile ov operate-on-number move-text magit jedi imenu-anywhere guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist flycheck expand-region exec-path-from-shell easy-kill discover-my-major diminish diff-hl crux browse-kill-ring beacon anzu ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
