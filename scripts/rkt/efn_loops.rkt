#lang racket

(let ([limit 4000000])
  (do ([sum 0] [previous 1 current] [current 1 (+ previous current)])
      ((>= current limit) sum)
      (if (even? current) (set! sum (+ current sum)) (void))))
