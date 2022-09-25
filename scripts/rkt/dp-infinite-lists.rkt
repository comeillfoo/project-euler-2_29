#lang racket
(provide distinct-powers)

(require racket/stream)

(define (distinct-powers left right)
  (stream-length (for/stream ([i
                               (remove-duplicates
                                (let ([powers (in-inclusive-range left right)])
                                  (stream->list (for*/stream ([a powers] [b powers]) (expt a b)))))])
                             i)))

(distinct-powers 2 100)

(module+ test
  (require rackunit)
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution")
  (check-equal? (distinct-powers 1 1) 1 "Single value: 1")
  (check-equal? (distinct-powers 100 100) 1 "Single value: 100^100")
  (check-equal? (distinct-powers 1 2) 3 "Quads with repetitions: {1^1, 1^2, 2^1, 2^2}")
  (check-equal? (distinct-powers 99 100)
                4
                "Quads without repetitions: {99^99, 99^100, 100^99, 100^100}"))
