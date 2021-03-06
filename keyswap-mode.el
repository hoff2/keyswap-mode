;; keyswap-mode
;; Chuck Hoffman, 2014
;; A simple minor mode to remap certain keys
;; license: http://www.wtfpl.net/txt/copying/

(define-minor-mode keyswap-mode
  "A mode to translate keys"
  :init-value nil
  :lighter " swap"
  :group 'swap
  :after-hook
  (if keyswap-mode
      (progn (setq keyswap-original-table keyboard-translate-table)
             (keyswap-swap-keys keyswap-pairs))
    ; put the old table back
    (setq keyboard-translate-table keyswap-original-table)))

(defun keyswap-swap-keys (pairs)
  (unless (eq pairs nil)
      (keyboard-translate (caar pairs) (cadar pairs))
      (keyboard-translate (cadar pairs) (caar pairs))
      (keyswap-swap-keys (cdr pairs))))

(provide 'keyswap-mode)
