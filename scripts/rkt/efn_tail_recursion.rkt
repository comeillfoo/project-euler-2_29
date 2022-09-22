#lang racket

(define (even-sum-of-fibonacci-less-than-inner limit sum previous current)
  (if (= limit 0)
      0
      (if (not (negative? (- current limit)))
          sum
          (if (even? current)
              (even-sum-of-fibonacci-less-than-inner limit
                                                     (+ sum current)
                                                     current
                                                     (+ previous current))
              (even-sum-of-fibonacci-less-than-inner limit sum current (+ previous current))))))


(define (even-sum-of-fibonacci-less-than limit)
  (if (negative? limit)
      (error "Invalid limit value")
      (even-sum-of-fibonacci-less-than-inner limit 0 1 1)))


(even-sum-of-fibonacci-less-than 4000000)
