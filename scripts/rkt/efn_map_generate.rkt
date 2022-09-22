#lang racket

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
                 (stream->list
                  (in-inclusive-range 1 (last-fibonacci-number-less-than 4000000 1 1 1))))))
