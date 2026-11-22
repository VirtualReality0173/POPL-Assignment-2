;; q4_tests_body.rkt -- test-only file, NOT part of the submission.
;; No #lang line: it is appended after sc_q4.rkt, which defines insert-if-short.

(define (check name actual expected)
  (display (if (equal? actual expected) "PASS " "FAIL "))
  (display name)
  (newline))

;; --- Spec examples ---
(check "1: spec example 1"
       (insert-if-short 42 '((1 2) (3 4 5) (6) ()) 3)
       '((42 1 2) (3 4 5) (42 6) (42)))

(check "2: spec example 2"
       (insert-if-short 0 '(((1) 2) (3) ((4 5 6) ())) 3)
       '((0 (0 1) 2) (0 3) (0 (4 5 6) (0))))

(check "3: empty top-level list, n=3"
       (insert-if-short 7 '() 3)
       '(7))

(check "4: empty top-level list, n=0"
       (insert-if-short 7 '() 0)
       '())

;; --- Extras ---
(check "5: n=0 on a nested list (unchanged)"
       (insert-if-short 9 '((1 (2)) 3 ()) 0)
       '((1 (2)) 3 ()))

(check "6: single-element list, short enough"
       (insert-if-short 5 '(1) 3)
       '(5 1))

(check "7: single-element list, length equals n (unchanged)"
       (insert-if-short 5 '(1) 1)
       '(1))

(check "8: atom-only list, short enough"
       (insert-if-short 8 '(1 2 3) 5)
       '(8 1 2 3))

(check "9: atom-only list, length equals n (unchanged)"
       (insert-if-short 8 '(1 2 3) 3)
       '(1 2 3))