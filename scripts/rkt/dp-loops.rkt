#lang racket
(provide distinct-powers)

(define (distinct-powers left right)
  (for/fold ([length 0])
            ([distinct-power
              (for/fold ([acc '()])
                        ([a-b (let ([powers (build-list (add1 (- right left))
                                                        (lambda (n) (+ n left)))])
                                (for*/list ([a powers] [b powers])
                                  (expt a b)))])
                (if (= (length (filter (lambda (x) (equal? x a-b)) acc)) 0) (list* a-b acc) acc))])
    (if (number? distinct-power)
        (add1 length)
        (raise-argument-error 'incorrect-type "number?" distinct-power))))

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
  (check-exn exn:fail:contract?
             (lambda ()
               (distinct-powers 2 -1)
               "Exception on right < left")))
