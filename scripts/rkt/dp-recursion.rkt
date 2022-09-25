#lang racket
(provide distinct-powers)

(require racket/set)

(define (inner-loop init limit b)
  (define a init)
  (if (= a limit) (set (expt a b)) (set-add (inner-loop (add1 a) limit b) (expt a b))))

(define (external-loop init_b init_a limit_b limit_a)
  (define b init_b)
  (if (= b limit_b)
      (inner-loop init_a limit_a b)
      (set-union (external-loop (add1 b) init_a limit_b limit_a) (inner-loop init_a limit_a b))))

(define (distinct-powers left right)
  (set-count (external-loop left left right right)))

(distinct-powers 2 100)

(module+ test
  (require rackunit)
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution"))
