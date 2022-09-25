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
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution"))
  