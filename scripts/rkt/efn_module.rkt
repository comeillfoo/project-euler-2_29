#lang racket


(define (fibonacci_numbers_less_than limit)
  (let loop ([previous 1] [current 1])
    (if (>= current limit)
      (list)
      (list* current (loop current (+ previous current))))))

(fibonacci_numbers_less_than 1000)


