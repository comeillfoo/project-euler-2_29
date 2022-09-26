#lang racket
(provide sum-of-even-fibonacci-numbers-less-than)

(define (sum-of-even-fibonacci-numbers-less-than limit)
  (if (negative? limit)
      (raise-argument-error 'negative-limit "non-negative value" limit)
      (let inner-summer ([sum 0] [previous 1] [current 1])
        (if (= limit 0)
          0
          (if (not (negative? (- current limit)))
            sum
            (if (even? current)
              (inner-summer (+ sum current) current (+ previous current))
              (inner-summer sum current (+ previous current))))))))

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
