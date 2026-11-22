#lang racket/base

;; id_q4.rkt  --  CS F301 PPL Assignment 2, Problem S2
;; Conditionally insert an atom into a nested list.
;;
;; Functions to be defined (definitions only, no top-level calls):
;;   my-length           - number of top-level elements of a list
;;   my-map              - apply a function to each element of a list
;;   list-item?          - #t for a pair or '(), #f for an atom
;;   insert-if-short     - insert x at the front of every short list, at every level
;;   print-insert-result - read x, lst, n from stdin and display the result
;;   make-inserter       - build an inserter from x and a length predicate

;; my-length: number of top-level elements of lst.
;; Tail-recursive with an accumulator, so a 10,000-element list is no problem.
(define (my-length lst)
  (let loop ((rest lst) (count 0))
    (if (null? rest)
        count
        (loop (cdr rest) (+ count 1)))))

;; my-map: apply the one-argument function f to every element of lst,
;; returning a new list in the same order.
;; Racket grows its stack on the heap, so 10,000 elements is fine.
(define (my-map f lst)
  (if (null? lst)
      '()
      (cons (f (car lst))
            (my-map f (cdr lst)))))

;; list-item?: #t if e is a list (a pair or the empty list), #f if e is an atom.
(define (list-item? e)
  (or (pair? e) (null? e)))

(define (insert-if-short x lst n)
  (let ((processed
         ;; Recurse into sublists; atoms are left unchanged.
         (my-map (lambda (e)
                   (if (list-item? e)
                       (insert-if-short x e n)
                       e))
                 lst)))
    ;; Length is measured on lst (the original), not on processed.
    (if (< (my-length lst) n)
        (cons x processed)
        processed)))

(define (print-insert-result)
  (let* ((x (read))
         (lst (read))
         (n (read)))
    (display (insert-if-short x lst n))
    (newline)))