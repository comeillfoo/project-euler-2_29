#lang racket
(provide sum-of-even-fibonacci-numbers-less-than)

(define (sum-of-even-fibonacci-numbers-less-than limit)
  (do ([sum 0] [previous 1 current] [current 1 (+ previous current)])
      ((>= current limit) sum)
      (if (even? current) (set! sum (+ current sum)) (void))))

(sum-of-even-fibonacci-numbers-less-than 4000000)

(module+ test
  (require rackunit)
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 4000000) 4613732 "Exact task solution"))
