(add-to-list 'load-path "~/.emacs.d/")

(require 'init-elpa)
(require 'init-autocomplete)
(require 'init-outline)
(require 'init-markdown)
(require 'init-speedbar)
(require 'init-misc)

;;modes i want at startup
(global-linum-mode 1)
(color-theme-solarized-dark)

;;disable git (or any version controls)
;;makes it faster as i mostly code over sshfs or tramp
(setq vc-handled-backends nil)

(defalias 'perl-mode 'cperl-mode)

;;easily goto a line
(global-set-key "\C-l" 'goto-line) 

;;visual/audio bells are annoying
(setq ring-bell-function 'ignore)

;;so is the tool bar
(setq tool-bar-mode -1)

;;i use emasc with terminal, so easily revert-buffer when there are
;;external changes
(global-set-key "\C-r" 'revert-buffer) ;

;; simple indentation for bash etc
(global-set-key "\C-ci" 'indent-region)

;; make all "yes or no" prompts show "y or n" instead
(fset 'yes-or-no-p 'y-or-n-p)

;; I use version control, no backup files everywhere
(setq make-backup-files nil)
(setq auto-save-default nil)

;;for emacsclient
(server-start)
