#lang racket


(define (fibonacci-numbers-less-than limit)
  (let loop ([previous 1] [current 1])
    (if (>= current limit)
      (list)
      (list* current (loop current (+ previous current))))))


(foldl + 0 (filter even? (fibonacci-numbers-less-than 4000000)))
