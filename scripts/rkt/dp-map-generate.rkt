#lang racket
(provide (all-defined-out))

(define (distinct-powers left right)
  (foldl +
         0
         (map (lambda (n) (quotient n n))
              (remove-duplicates (append* (let ([powers (inclusive-range left right)])
                                            (for/list ([a powers])
                                              (map (lambda (n) (expt n a)) powers))))))))

(distinct-powers 2 100)
