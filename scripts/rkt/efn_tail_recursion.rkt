#lang racket

(define (even_sum_of_fibonacci_less_than_inner limit sum previous current)
  (if (= limit 0)
      0
      (if (not (negative? (- current limit)))
          sum
          (if (= (remainder current 2) 0)
              (even_sum_of_fibonacci_less_than_inner limit
                                                     (+ sum current)
                                                     current
                                                     (+ previous current))
              (even_sum_of_fibonacci_less_than_inner limit sum current (+ previous current))))))


(define (even_sum_of_fibonacci_less_than limit)
  (if (negative? limit)
      (error "Invalid limit value")
      (even_sum_of_fibonacci_less_than_inner limit 0 1 1)))


(even_sum_of_fibonacci_less_than 4000000)
