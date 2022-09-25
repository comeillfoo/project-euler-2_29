#lang racket
(provide fibonacci-numbers-less-than)

(define (fibonacci-numbers-less-than limit)
  (let loop ([previous 1] [current 1])
    (if (>= current limit) (list) (list* current (loop current (+ previous current))))))

(foldl + 0 (filter even? (fibonacci-numbers-less-than 4000000)))

(module+ test
  (require rackunit)
  (check-equal? (foldl + 0 (filter even? (fibonacci-numbers-less-than 4000000)))
                4613732
                "Exact task solution")
  (check-true (null? (fibonacci-numbers-less-than 0)) "Empty list on no numbers")
  (check-true (null? (fibonacci-numbers-less-than 1)) "Empty list on no numbers")
  (check-equal? (length (fibonacci-numbers-less-than 2)) 1 "Single element on one number")
  (check-equal? (length (fibonacci-numbers-less-than 3)) 2 "Two elements on two numbers"))
