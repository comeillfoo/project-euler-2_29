#lang racket
(provide distinct-powers)

(define (distinct-powers left right)
  (for/fold ([length 0])
            ([distinct_power
              (for/fold ([acc '()])
                        ([a_b (let ([powers (build-list (sub1 right) (lambda (n) (+ n left)))])
                                (for*/list ([a powers] [b powers])
                                  (expt a b)))])
                (if (= (length (filter (lambda (x) (equal? x a_b)) acc)) 0) (list* a_b acc) acc))])
    (if (number? distinct_power)
        (add1 length)
        (raise-argument-error 'incorrect-type "number?" distinct_power))))

(distinct-powers 2 100)

(module+ test
  (require rackunit)
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution"))
