#lang racket
(provide (all-defined-out))

(require racket/set)

(define (loop-a limit a b unique)
  (if (> a limit) unique (loop-a limit (add1 a) b (set-add unique (expt a b)))))

(define (loop-b limit b unique)
  (if (> b limit) unique (loop-b limit (add1 b) (loop-a limit 2 b unique))))

(define (distinct-powers left right)
  (set-count (loop-b right left (set))))

(distinct-powers 2 100)
