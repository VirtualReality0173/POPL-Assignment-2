
#lang racket/base

(require rackunit
         racket/port)
(require "../code/43_q3.rkt")

(define t1 '(a (b () ()) (c () ())))
(define t2 '(1 (2 (4 () ()) ()) (3 () (5 () ()))))
(define empty-tree '())

; Inorder traversal
(check-equal? (inorder t1) '(b a c))
(check-equal? (inorder t2) '(4 2 1 3 5))
(check-equal? (inorder empty-tree) '())

; Preorder traversal
(check-equal? (preorder t1) '(a b c))
(check-equal? (preorder t2) '(1 2 4 3 5))
(check-equal? (preorder empty-tree) '())

; Postorder traversal
(check-equal? (postorder t1) '(b c a))
(check-equal? (postorder t2) '(4 2 5 3 1))
(check-equal? (postorder empty-tree) '())

; Height
(check-equal? (tree-height t1) 2)
(check-equal? (tree-height t2) 3)
(check-equal? (tree-height empty-tree) 0)

; Leaf count
(check-equal? (leaf-count t1) 2)
(check-equal? (leaf-count t2) 2)
(check-equal? (leaf-count empty-tree) 0)

(displayln "All S1 tests passed.")

; Required printing functions
(check-equal?
 (with-output-to-string (lambda () (print-inorder t1)))
 "(b a c)\n")

(check-equal?
 (with-output-to-string (lambda () (print-all-traversals t1)))
 "(b a c)\n(a b c)\n(b c a)\n")

(check-equal?
 (with-output-to-string (lambda () (print-height-and-leaves t2)))
 "(3 2)\n")