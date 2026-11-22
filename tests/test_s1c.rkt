
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

(define left-skewed
  '(1 (2 (3 () ()) ()) ()))

(define right-skewed
  '(1 () (2 () (3 () ()))))

(define empty-tree '())

; Test 1: Complete binary tree
(check-equal?
 (with-output-to-string
  (lambda () (print-height-and-leaves t1)))
 "(3 4)\n")

; Test 2: Small balanced tree
(check-equal?
 (with-output-to-string
  (lambda () (print-height-and-leaves t2)))
 "(2 2)\n")

; Test 3: Single node
(check-equal?
 (with-output-to-string
  (lambda () (print-height-and-leaves single-node)))
 "(1 1)\n")

; Test 4: Left-skewed tree
(check-equal?
 (with-output-to-string
  (lambda () (print-height-and-leaves left-skewed)))
 "(3 1)\n")

; Test 5: Right-skewed tree
(check-equal?
 (with-output-to-string
  (lambda () (print-height-and-leaves right-skewed)))
 "(3 1)\n")

; Test 6: Empty tree
(check-equal?
 (with-output-to-string
  (lambda () (print-height-and-leaves empty-tree)))
 "(0 0)\n")

(display "All S1.c tests passed.")
(newline)
