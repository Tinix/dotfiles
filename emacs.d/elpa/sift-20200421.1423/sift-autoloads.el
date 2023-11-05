;;; sift-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "sift" "sift.el" (0 0 0 0))
;;; Generated autoloads from sift.el

(autoload 'sift-regexp "sift" "\
Run a sift search with `REGEXP' rooted at `DIRECTORY'.
`ARGS' provides Sift command line arguments. With prefix
argument, prompt for command line arguments.

\(fn REGEXP DIRECTORY &optional ARGS)" t nil)

(register-definition-prefixes "sift" '("sift"))

;;;***

;;;### (autoloads nil nil ("sift-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; sift-autoloads.el ends here
