
#lang racket/base

; ==================================================
; S1 - Binary Tree Traversals
; ==================================================

; Inorder traversal: Left, Root, Right

(define (inorder tree)
  (if (null? tree)
      '()
      (append-values
       (inorder (cadr tree))
       (cons (car tree)
             (inorder (caddr tree))))))

; Preorder traversal: Root, Left, Right

(define (preorder tree)
  (if (null? tree)
      '()
      (cons (car tree)
            (append-values
             (preorder (cadr tree))
             (preorder (caddr tree))))))

; Postorder traversal: Left, Right, Root

(define (postorder tree)
  (if (null? tree)
      '()
      (append-values
       (append-values
        (postorder (cadr tree))
        (postorder (caddr tree)))
       (list (car tree)))))

; Helper: append two lists recursively.

(define (append-values lst1 lst2)
  (if (null? lst1)
      lst2
      (cons (car lst1)
            (append-values (cdr lst1) lst2))))

; ==================================================
; Height
; ==================================================

(define (tree-height tree)
  (if (null? tree)
      0
      (+ 1
         (max (tree-height (cadr tree))
              (tree-height (caddr tree))))))

; ==================================================
; Leaf count
; ==================================================

(define (leaf-count tree)
  (if (null? tree)
      0
      (if (and (null? (cadr tree))
               (null? (caddr tree)))
          1
          (+ (leaf-count (cadr tree))
             (leaf-count (caddr tree))))))

; ==================================================
; Required printing functions
; ==================================================

; Print inorder traversal.

(define (print-inorder tree)
  (display (inorder tree))
  (newline))

; Print inorder, preorder and postorder traversals.

(define (print-all-traversals tree)
  (display (inorder tree))
  (newline)
  (display (preorder tree))
  (newline)
  (display (postorder tree))
  (newline))

; Print height and leaf count.

(define (print-height-and-leaves tree)
  (display (list (tree-height tree)
                 (leaf-count tree)))
  (newline))
  
(provide inorder
         preorder
         postorder
         tree-height
         leaf-count
         print-inorder
         print-all-traversals
         print-height-and-leaves)