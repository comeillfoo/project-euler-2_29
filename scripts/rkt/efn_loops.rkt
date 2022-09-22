#lang racket

(define (even_fibonacci_numbers_less_than limit)
  (let loop ([previous 1] [current 1])
    (if (>= current limit)
      (list)
      (if (even? current)
        (list* current (loop current (+ previous current)))
        (loop current (+ previous current))))))


(for/sum ([number (even_fibonacci_numbers_less_than 4000000)]) number)
