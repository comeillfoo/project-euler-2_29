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
    [(= limit 1) 0]
    [(zero? limit) 0]
    [else (raise-argument-error 'negative-limit "non-negative value" limit)]))

(sum-of-even-fibonacci-numbers-less-than 4000000)

(module+ test
  (require rackunit)
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 4000000) 4613732 "Exact task solution")
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 2) 0 "Correct sum on no even numbers")
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 9) 10 "Correct sum on even numbers 2 and 8")
  (check-equal? (sum-of-even-fibonacci-numbers-less-than 89)
                44
                "Correct sum on even numbers less than 89")
  (check-exn exn:fail:contract?
             (lambda () (sum-of-even-fibonacci-numbers-less-than -1))
             "Error on negative limit"))
