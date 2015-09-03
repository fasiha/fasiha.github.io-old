#lang racket

(require txexpr)
(require racket/date pollen/world pollen/pygments pollen/decode)

;;; Helper functions
(define (symbol-or-string in) (if (string? in) in (symbol->string in)))

;;; HTML functions
(define (emphatic . xs) `(em ,@xs))
(define (link url . xs) `(a ((href ,url)) ,@xs))
(define (really-emph . xs) `(splice-me ,@(list '(em "I'm about to speak… ") '(b
      "Pay attention!: ") `(u ,@xs))))

(define (title . xs) `(h1 ,@xs))
(define (author . xs) `(p ((class "subtitle")) ,@xs))
(define (code . xs) `(span ((class "code")) ,@xs))

(define (sidenote label . xs)
  (define string-label (symbol-or-string label))
  `(splice-me ,@(list 
    `(label ((for ,string-label)(class "margin-toggle sidenote-number"))) 
    `(input ((id ,string-label)(class "margin-toggle")(type "checkbox"))) 
    `(span ((class "sidenote")) ,@xs))))

(define ($ . xs)
  `(mathjax ,(apply string-append `("$" ,@xs "$"))))
(define ($$ . xs)
  `(mathjax ,(apply string-append `("$$" ,@xs "$$"))))

;;; HTML render helpers
(define (splice xs)
  (define tags-to-splice '(splice-me))
  (apply append (for/list ([x (in-list xs)])
                  (if (and (txexpr? x) (member (get-tag x) tags-to-splice))
                      (get-elements x)
                      (list x)))))

(define (root . items)
  (decode `(decoded-root ,@items)
          #:txexpr-elements-proc (compose1 detect-paragraphs splice)
          #:exclude-tags '(style script pre)
          ))

;;; Export
(provide (all-defined-out))
