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
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution"))
