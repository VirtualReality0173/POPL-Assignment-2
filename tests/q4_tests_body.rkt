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

;; ===== Stress tests and make-inserter tests =====

;; (nest k): k levels of single-element lists around 1.  (nest 1) = (1), (nest 3) = (((1)))
(define (nest k)
  (let loop ((i 0) (acc 1))
    (if (= i k)
        acc
        (loop (+ i 1) (list acc)))))

;; (nest-with-zeros k): what (insert-if-short 0 (nest k) 2) should give:
;; every level has length 1 < 2, so every level gets a 0 in front.
;; (nest-with-zeros 1) = (0 1), (nest-with-zeros 3) = (0 (0 (0 1)))
(define (nest-with-zeros k)
  (let loop ((i 1) (acc (list 0 1)))
    (if (= i k)
        acc
        (loop (+ i 1) (list 0 acc)))))

;; (flat k): the list (1 2 ... k)
(define (flat k)
  (let loop ((i k) (acc '()))
    (if (= i 0)
        acc
        (loop (- i 1) (cons i acc)))))

;; (singletons k): the list ((1) (1) ... (1)) with k copies
(define (singletons k)
  (let loop ((i 0) (acc '()))
    (if (= i k)
        acc
        (loop (+ i 1) (cons (list 1) acc)))))

;; --- Nesting depth 100 ---
(check "10: depth 100, every level short (n=2)"
       (insert-if-short 0 (nest 100) 2)
       (nest-with-zeros 100))

(check "11: depth 100, nothing short (n=1, unchanged)"
       (insert-if-short 0 (nest 100) 1)
       (nest 100))

;; --- 10,000-element lists (check structure, do not print) ---
(define big-short (insert-if-short 0 (flat 10000) 10001))
(check "12: flat 10000, short (n=10001): first element is 0"
       (car big-short)
       0)
(check "13: flat 10000, short (n=10001): 10001 top-level elements"
       (length big-short)
       10001)
(check "14: flat 10000, short (n=10001): second element is 1"
       (cadr big-short)
       1)

(define big-same (insert-if-short 0 (flat 10000) 10000))
(check "15: flat 10000, length equals n: unchanged"
       big-same
       (flat 10000))

(define big-nested (insert-if-short 0 (singletons 10000) 2))
(check "16: 10000 singleton sublists (n=2): count unchanged"
       (length big-nested)
       10000)
(check "17: 10000 singleton sublists (n=2): first element is (0 1)"
       (car big-nested)
       '(0 1))

;; --- make-inserter with other predicates ---
(check "18: make-inserter, only even-length lists"
       ((make-inserter 'x even?) '((1 2) (3) () (4 5 6 7) ((8 9))))
       '((x 1 2) (3) (x) (x 4 5 6 7) ((x 8 9))))

(check "19: make-inserter, even-length top-level list"
       ((make-inserter 'x even?) '(1 2))
       '(x 1 2))

(check "20: make-inserter, always-true predicate on empty list"
       ((make-inserter 'x (lambda (len) #t)) '())
       '(x))