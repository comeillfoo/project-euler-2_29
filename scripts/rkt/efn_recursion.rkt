#lang racket

(define (even-sum-of-fibonacci-numbers limit)
  (cond
    [(> limit 1)
     (let ([closest_number (let closest-fibonacci-number ([previous 1] [current 1])
                             (if (>= current limit)
                                 previous
                                 (closest-fibonacci-number current (+ previous current))))])
       (if (even? closest_number)
           (+ closest_number (even-sum-of-fibonacci-numbers closest_number))
           (even-sum-of-fibonacci-numbers closest_number)))]
    [else 0]))

(even-sum-of-fibonacci-numbers 4000000)
