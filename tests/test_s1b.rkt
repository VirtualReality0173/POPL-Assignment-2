
#lang racket/base

(require rackunit
         racket/port)

(require "../code/43_q3.rkt")

(define t1
  '(4 (2 (1 () ()) (3 () ()))
      (6 (5 () ()) (7 () ()))))

(define t2
  '(a (b () ()) (c () ())))

(define single-node
  '(10 () ()))

(define empty-tree '())

; Test 1: Complete binary tree
(check-equal?
 (with-output-to-string
  (lambda () (print-all-traversals t1)))
 "(1 2 3 4 5 6 7)\n(4 2 1 3 6 5 7)\n(1 3 2 5 7 6 4)\n")

; Test 2: Symbol-valued tree
(check-equal?
 (with-output-to-string
  (lambda () (print-all-traversals t2)))
 "(b a c)\n(a b c)\n(b c a)\n")

; Test 3: Single-node tree
(check-equal?
 (with-output-to-string
  (lambda () (print-all-traversals single-node)))
 "(10)\n(10)\n(10)\n")

; Test 4: Empty tree
(check-equal?
 (with-output-to-string
  (lambda () (print-all-traversals empty-tree)))
 "()\n()\n()\n")

(display "All S1.b tests passed.")
(newline)
