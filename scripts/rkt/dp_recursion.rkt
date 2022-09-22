#lang racket

(require racket/set)

(define (inner-loop init limit b)
  (define a init)
  (if (= a limit) (set (expt a b)) (set-add (inner-loop (add1 a) limit b) (expt a b))))

(define (distinct-powers init_b init_a limit_b limit_a)
  (define b init_b)
  (if (= b limit_b)
      (inner-loop init_a limit_a b)
      (set-union (distinct-powers (add1 b) init_a limit_b limit_a) (inner-loop init_a limit_a b))))

(set-count (distinct-powers 2 2 100 100))
