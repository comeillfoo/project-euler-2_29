#lang racket

(require racket/stream)

(define (distinct-powers left right)
  (stream-length (for/stream ([i
                               (remove-duplicates
                                (let ([powers (in-inclusive-range left right)])
                                  (stream->list (for*/stream ([a powers] [b powers]) (expt a b)))))])
                             i)))

(distinct-powers 2 100)
