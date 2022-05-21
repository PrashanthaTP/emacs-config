;; initial startup settings
(add-hook 'emacs-startup-hook 'toggle-frame-maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; Keyboard-centric user interface
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq ring-bell-function 'ignore)
;;(setq line-number-mode t)

(global-linum-mode)

;;https://zhangda.wordpress.com/2016/02/15/configurations-for-beautifying-emacs-org-mode/
;; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(setq utf-translate-cjk-mode nil)

(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)

;; set the default encoding system
(prefer-coding-system 'utf-8)
(setq default-file-name-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; backwards compatibility as default-buffer-file-coding-system
;; is deprecated in 23.2.
(if (boundp buffer-file-coding-system)
    (setq buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; theme settings
;;(load-theme 'wombat)
;;https://sleeplessbeastie.eu/2014/06/09/how-to-use-solarized-theme-in-emacs/
;;(add-to-list 'load-path "~/.config/emacs/elisp/packages/emacs-color-theme-solarized-master/")
;;(setq custom-theme-load-path (add-to-list 'custom-theme-load-path "~/.config/emacs/elisp/packages/colors/emacs-color-theme-solarized-master"))
(add-to-list 'custom-theme-load-path "~/.config/emacs/elisp/packages/colors/emacs-color-theme-solarized")
;;(require 'color-theme)
;;(require 'color-theme-solarized)
;;(color-theme-initialize)
;;(color-theme-solarized-dark)

(set-frame-parameter nil 'background-mode 'dark)
(load-theme 'solarized t)
;;(enable-theme 'solarized)
;;(add-to-list 'default-frame-alist '(background-mode dark))

;; set scratch buffer mode to org
;; to test speeding up opening org files later
(setq initial-major-mode 'org-mode)
(setq org-startup-folded 'fold)
(setq org-src-fontify-natively t)
(custom-set-faces
 '(org-block-begin-line
   ((t (:underline "#002F46" :foreground "#586E75" :background "#002F36" :extend t))))
 '(org-block
   ((t (:background "#002835" :extend t))))
 '(org-block-end-line
   ((t (:underline "#002F46" :foreground "#586E75" :background "#002F36" :extend t))))
 )
;;https://stackoverflow.com/questions/11670654/how-to-resize-images-in-org-mode
(setq org-image-actual-width nil)

(global-set-key (kbd "C-c e") 'org-babel-tangle)

;;https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(add-to-list 'load-path "~/.config/emacs/elisp/packages/org/org-bullets/")
;; https://github.com/integral-dw/org-bullets#faq--troubleshooting
(setq inhibit-compacting-font-caches t)
  (font-lock-add-keywords 'org-mode
			  '(("^ *\\([-]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

  ;; use org-bullets-mode for utf8 symbols as org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

  ;; make available "org-bullet-face" such that I can control the font size individually
 ;;(setq org-bullets-face-name (quote org-bullet-face))
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;;
;; make available "org-bullet-face" such that I can control the font size individually
  ;;(setq org-bullets-face-name (quote org-bullet-face))

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
;;(set-face-attribute 'default nil :height 150)


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

;; (global-set-key (kbd "C-c /") 'uncomment-region)
(global-set-key (kbd "C-c /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c t") 'org-babel-tangle)
