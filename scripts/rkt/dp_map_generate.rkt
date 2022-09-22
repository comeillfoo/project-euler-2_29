#lang racket

(let* ([a (build-list (expt 18 18) (lambda (n) (+ (remainder n 99) 2)))]
       [b (flatten (group-by (lambda (n) n) a))])
  (length (remove-duplicates (map expt a b))))
