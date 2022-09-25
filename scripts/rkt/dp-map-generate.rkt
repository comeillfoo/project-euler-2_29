#lang racket
(provide distinct-powers)

(define (distinct-powers left right)
  (foldl +
         0
         (map (lambda (n) (quotient n n))
              (remove-duplicates (append* (let ([powers (inclusive-range left right)])
                                            (for/list ([a powers])
                                              (map (lambda (n) (expt n a)) powers))))))))

(distinct-powers 2 100)

(module+ test
  (require rackunit)
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution")
  (check-equal? (distinct-powers 1 1) 1 "Single value: 1")
  (check-equal? (distinct-powers 100 100) 1 "Single value: 100^100")
  (check-equal? (distinct-powers 1 2) 3 "Quads with repetitions: {1^1, 1^2, 2^1, 2^2}")
  (check-equal? (distinct-powers 99 100)
                4
                "Quads without repetitions: {99^99, 99^100, 100^99, 100^100}")
  (check-equal? (distinct-powers 2 -1) 0 "Zero on right < left"))
