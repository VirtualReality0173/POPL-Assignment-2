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
(display (my-length '(1 2 3)))
