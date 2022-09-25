#lang racket
(provide fibonacci
         last-fibonacci-number-less-than)

(define (fibonacci n)
  (if (<= n 2) n (+ (fibonacci (sub1 n)) (fibonacci (- n 2)))))

(define (last-fibonacci-number-less-than limit previous current number)
  (if (>= current limit)
      (sub1 number)
      (last-fibonacci-number-less-than limit current (+ previous current) (add1 number))))

(foldl +
       0
       (map (lambda (number) (if (even? number) number 0))
            (map fibonacci
                 (sequence->list
                  (in-inclusive-range 1 (last-fibonacci-number-less-than 4000000 1 1 1))))))

(module+ test
  (require rackunit)
  (check-equal? (fibonacci 0) 0 "Initial fibonacci number 0")
  (check-equal? (fibonacci 1) 1 "Initial fibonacci number 1")
  (check-equal? (fibonacci 2) 2 "Initial fibonacci number 2")
  (check-equal? (fibonacci 3) 3 "Calculation of 3rd fibonacci number")
  (check-equal? (fibonacci 4) 5 "Calculation of 4th fibonacci number")
  (check-equal? (fibonacci 5) 8 "Calculation of 5th fibonacci number")
  (check-equal? (fibonacci 6) 13 "Calculation of 6th fibonacci number")
  (check-equal? (fibonacci 7) 21 "Calculation of 7th fibonacci number")
  (check-equal? (fibonacci 8) 34 "Calculation of 8th fibonacci number")
  (check-equal? (fibonacci 9) 55 "Calculation of 9th fibonacci number")
  (check-equal? (fibonacci 10) 89 "Calculation of 10th fibonacci number")
  (check-equal? (fibonacci 10) 89 "Calculation of 10th fibonacci number")
  (for ([limit (in-inclusive-range 1 40000)])
    (check-true (< (fibonacci (last-fibonacci-number-less-than limit 1 1 1)) limit)
                "Correct number that less than limit")))
