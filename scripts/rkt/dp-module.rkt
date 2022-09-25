#lang racket
(provide (all-defined-out))

(define (distinct-powers left right)
  (foldl +
         0
         (map (lambda (n) (quotient n n))
              (remove-duplicates (let ([powers (build-list (sub1 right) (lambda (n) (+ n left)))])
                                   (for*/list ([a powers] [b powers])
                                     (expt a b)))))))

(distinct-powers 2 100)
