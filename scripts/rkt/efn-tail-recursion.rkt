#lang racket
(provide sum-of-even-fibonacci-numbers-less-than)

(define (sum-of-even-fibonacci-numbers-less-than-inner limit sum previous current)
  (if (= limit 0)
      0
      (if (not (negative? (- current limit)))
          sum
          (if (even? current)
              (sum-of-even-fibonacci-numbers-less-than-inner limit
                                                     (+ sum current)
                                                     current
                                                     (+ previous current))
              (sum-of-even-fibonacci-numbers-less-than-inner limit sum current (+ previous current))))))

(define (sum-of-even-fibonacci-numbers-less-than limit)
  (if (negative? limit)
      (error "Invalid limit value")
      (sum-of-even-fibonacci-numbers-less-than-inner limit 0 1 1)))

(sum-of-even-fibonacci-numbers-less-than 4000000)


(module+ test
  (require rackunit)
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 4000000) 4613732 "Exact task solution"))
