#lang racket

(define (sum-of-even-fibonacci-numbers-less-than limit)
  (do ([sum 0] [previous 1 current] [current 1 (+ previous current)])
      ((>= current limit) sum)
      (if (even? current) (set! sum (+ current sum)) (void))))

(sum-of-even-fibonacci-numbers-less-than 4000000)
