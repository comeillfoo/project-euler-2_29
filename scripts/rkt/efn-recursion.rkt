#lang racket
(provide sum-of-even-fibonacci-numbers-less-than)

(define (sum-of-even-fibonacci-numbers-less-than limit)
  (cond
    [(> limit 1)
     (let ([closest-number (let closest-fibonacci-number ([previous 1] [current 1])
                             (if (>= current limit)
                                 previous
                                 (closest-fibonacci-number current (+ previous current))))])
       (if (even? closest-number)
           (+ closest-number (sum-of-even-fibonacci-numbers-less-than closest-number))
           (sum-of-even-fibonacci-numbers-less-than closest-number)))]
    [else 0]))

(sum-of-even-fibonacci-numbers-less-than 4000000)


(module+ test
  (require rackunit)
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 4000000) 4613732 "Exact task solution"))
