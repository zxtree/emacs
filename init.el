;;sudo save
(defun sudo-save ()
  (interactive)
  (if (not buffer-file-name)
      (write-file (concat "/sudo:root@localhost:" (ido-read-file-name "File:")))
    (write-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; ;;SLIME
(setq inferior-lisp-program "/usr/local/Cellar/sbcl/1.3.5/bin/sbcl")
(add-to-list 'load-path "~/emacs_conf/slime/")
(require 'slime-autoloads)
(add-to-list 'slime-contribs 'slime-fancy)

(defun my:ensure-python.el (&optional branch overwrite)
  "Install python.el from BRANCH.
After the first install happens the file is not overwritten again
unless the optional argument OVERWRITE is non-nil.  When called
interactively python.el will always be overwritten with the
latest version."
  (interactive
   (list
    (completing-read "Install python.el from branch: "
                     (list "master" "emacs-24")
                     nil t)
    t))
  (let* ((branch (or branch "master"))
         (url (format
               (concat "http://git.savannah.gnu.org/cgit/emacs.git/plain"
                       "/lisp/progmodes/python.el?h=%s") branch))
         (destination (expand-file-name "python.el" custom_emacs_dir))
         (write (or (not (file-exists-p destination)) overwrite)))
    (when write
      (with-current-buffer
          (url-retrieve-synchronously url)
        (delete-region (point-min) (1+ url-http-end-of-headers))
        (write-file destination))
      (byte-compile-file destination t)
      destination)))

;; melpa update python.el;;
;;(my:ensure-python.el)

;; elpy
;;(elpy-enable)

;; ipython
(require 'python)
(setq python-shell-interpreter "/usr/local/Cellar/python/2.7.12/bin/python")
;; (setq python-shell-interpreter "/usr/local/bin/ipython"
;;       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;       python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
;;       python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
;;       python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
;;       python-shell-interpreter-args "-i")

;; auto-complete jedi:

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)         

;;(web-mode)
(add-to-list 'load-path "~/emacs_conf/web-mode")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
