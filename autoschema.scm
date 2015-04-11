;;; autoschema.scm -- A library for automating database setup.
;;;
;;;   Copyright © 2013 by Matthew C. Gushee <matt@gushee.net>
;;;   This program is open-source software, released under the
;;;   BSD license. See the accompanying LICENSE file for details.

(require-library sql-de-lite)

(module autoschema
        *

        (import-for-syntax scheme chicken)
        (import-for-syntax (prefix sql-de-lite sd:))

(define-for-syntax (scheme-sym->field-name sym)
  (list->string
    (map
      (lambda (c) (if (char=? c #\-) #\_ c))
      (string->list (symbol->string sym)))))

(define-for-syntax (selector->string sel)
  (let ((field (scheme-sym->field-name (car sel)))
        (match (cadr sel)))
    (string-append
      field
      " = "
      (if (string? match)
        "'" match "'"
        (->string match)))))

(define-for-syntax (compound-selector sel . sels)
  (foldl
    (lambda (head tail) (string-append head " AND " (selector->string tail)))
    (selector->string sel)
    sels)))

(define-syntax define-insert-proc
  (syntax-rules ()
    ((_ table (field1 field2 ...))
     ())))

(define-syntax define-delete-proc
  (syntax-rules ()
    ((_ table selector)
     (let ((qstring (string-append "DELETE FROM " table " WHERE " (selector->string selector) ";")))

    ((_ table selector1 selector2 selector3 ...)

(define-syntax create-table
  (syntax-rules ()
    ((_ conn (table-id (field-spec1 field-spec2 ...)))
     (let* ((table-id (scheme-sym->field-name table-id))
            )
       ))))



) ; END MODULE

;;; IIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
;;; ------------------------------------------------------------------------

;;; OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO

;;; ========================================================================
;;; ------------------------------------------------------------------------

; vim:et:ai:ts=2 sw=2
