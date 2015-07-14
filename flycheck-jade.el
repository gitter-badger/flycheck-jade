;;; flycheck-.el --- Support jade in flycheck

;; Copyright (C) 2015  <rob@oconnor.ninja>
;; Created: July 14, 2015
;; Version: 0.1
;; Package-Requires: ((flycheck "0.23"))

;;; Commentary:

;; This package adds support for jade to flycheck. To use it, add
;; to your init.el:

;; (require 'flycheck-jade)
;; (add-hook 'jade-mode-hook 'flycheck-mode)

;;; License:

;; This file is not part of GNU Emacs.
;; However, it is distributed under the same license.

;; GNU Emacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
(require 'flycheck)
(flycheck-define-checker jade
  "A Jade syntax checker using the Jade compiler.

See URL `http://jade-lang.com'."
  :command ("jade" source)
  :error-patterns
  ;; The pattern is based on the pattern in
  ;; https://github.com/tardyp/SublimeLinter-jade/blob/master/linter.py#L23;
  ;; tweaked slightly to:
  ;; Error: (\S+):(\d+).*\r?\n(?:.*\|.*\n)+.*\n(.*)
  ((error line-start "Error: " (file-name) ":" line (zero-or-more not-newline)
          (zero-or-one "\r") "\n" (one-or-more (and (zero-or-more not-newline) "|" (zero-or-more not-newline) "\n")) (zero-or-more not-newline) "\n" (message) line-end))
  :modes jade-mode)

(add-to-list 'flycheck-checkers 'jade)

(provide 'flycheck-jade)
;;; Fin. 
