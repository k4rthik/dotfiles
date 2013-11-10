;;kill-ring
(require-package 'browse-kill-ring)
(global-set-key "\C-ck" 'browse-kill-ring)

;;list buffers in a better way
(require-package 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;flycheck
(require-package 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;;python mode
(require-package 'python-mode)
(add-hook 'python-mode-hook
          (lambda ()
             (setq flycheck-checker 'python-flake8)
             (define-key python-mode-map "\r" 'newline-and-indent)))

;;paren_mode
(show-paren-mode t)
(setq show-paren-delay 0.0)


;; perltidy , format perl code
(defun perltidy ()
  "Run perltidy on the current region or buffer."
  (interactive)
  (save-excursion
    (unless mark-active (mark-defun))
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))
(global-set-key "\C-cf" 'perltidy)

;;open the file using external program (ex: C-c o to open markdown in chrome)
(defun prelude-open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))
(global-set-key "\C-co" 'prelude-open-with)

;; from https://gist.github.com/bradleywright/2046593
;; This sets the Emacs "PATH" environment variable and the `exec-path` 
;; variable to the same value your login shell sees. The reason this 
;; is necessary is because of this:
;; 
;; http://developer.apple.com/library/mac/#qa/qa1067/_index.html
;;
;; Basically apps launched from Finder inherit their environment from
;; a .plist file rather than the shell environment.
 
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
 
;; call function now
(set-exec-path-from-shell-PATH)

(provide 'init-misc)
