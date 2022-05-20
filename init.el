;; initial startup settings
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Keyboard-centric user interface
  (setq inhibit-startup-message t)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (defalias 'yes-or-no-p 'y-or-n-p)



;;(load (format "%s/%s" user-emacs-directory "minimal/packages_config"))
;;(Load (concat user-emacs-directory "minimal/packages_config"))
;;(load (expand-file-name (concat user-emacs-directory "packages_config.el")))

;; font settings
;;(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font Mono"))
;;(add-to-list 'default-frame-alist '(font . "Source Code Pro"))
;;(set-face-attribute 'default t :font "Source Code Pro")
;;(set-face-attribute 'default t :font "Source Code Pro")
(set-frame-font "SauceCodePro NF 12" nil t)
;;  (set-face-attribute
  ;;  'default (selected-frame) :font
    ;;"-outline-SauceCodePro NF-medium-normal-normal-mono-11-*-*-*-c-*-iso8859-1")

;; (set-frame-font
;;    "-outline-SauceCodePro NF-medium-normal-normal-mono-11-*-*-*-c-*-iso8859-1")
;; (set-face-attribute 'default (selected-frame) :height 200)
(set-face-attribute 'default nil :height 150)
;; theme settings
(load-theme 'wombat)

;; emacs basics

;; movement :
;; C-n,C-p,C-f,C-b
;; C-a,C-e
;; Alt-f and Alt-b : word jumping

;; Undo
;; C-_ or C-S-<->

;; Copy pasting
;; Start selecting with C-SPC or C-space
;; Copy using Alt-w and Paste using C-y
;; https://emacsredux.com/blog/2014/01/01/a-peek-at-emacs-24-dot-4-rectangular-selection/
;; deletion
;; delete current character with C-d
;; delete word with M-d

;; Split using C-x 2 and C-x 4
;; Jump between splits using C-x o
;; Close window using C-x 0 (zero)

;; Open file using : C-x C-f

;; Run current expression as elisp : C-x C-e
;; Open cmd panel : Alt-m and then type command

;; Change theme temporariy : M-x load-theme <ENTER>
;; and then presee <TAB> to see possible options

;; Switch between buffers
;; C-x b
;; To open Scratch buffer : C-x b <ENTER> *scratch*

;; Save file
;; C-x C-s

;; Searching
;; C-s : Incremental search
;; type the search-key then hit enter
;; type C-s or C-r to cycle through search results
(windmove-default-keybindings 'meta);;https://emacs.stackexchange.com/a/3460


;;Keybindings
;; (global-set-key (kbd "C-c /") 'uncomment-region)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c t") 'org-babel-tangle)
;; dont keep autosave files "^#<files># after saving
(setq delete-auto-save-files t)

;; backup directory
;; https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-Tips-Cleaning.org
(setq backup-directory-alist `((".".,(expand-file-name "tmp/backup" user-emacs-directory))))


;; manage auto files
;; autosave dont create directory automatically
 (make-directory (expand-file-name "tmp/auto-saves" user-emacs-directory) t)
 (setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
       auto-save-file-name-transform `((".*" , (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)))

;; Python settings

 (add-hook 'python-mode-block
	   (function (lambda ()
		       (setq indent-tabs-mode nil
			     tab-width 4))))


(setq org-edit-src-content-indentation 0)
