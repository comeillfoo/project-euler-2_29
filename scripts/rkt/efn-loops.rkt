#lang racket
(provide sum-of-even-fibonacci-numbers-less-than)

(define (sum-of-even-fibonacci-numbers-less-than limit)
  (do ([sum 0] [previous 1 current] [current 1 (+ previous current)])
      ((>= current limit) sum)
      (if (even? current) (set! sum (+ current sum)) (void))))

(sum-of-even-fibonacci-numbers-less-than 4000000)

(module+ test
  (require rackunit)
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 4000000) 4613732 "Exact task solution")
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 2) 0 "Correct sum on no even numbers")
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 9) 10 "Correct sum on even numbers 2 and 8")
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 89)
                44
                "Correct sum on even numbers less than 89"))
