#lang racket

(require racket/stream)

(stream-length (for/stream ([i
                             (remove-duplicates
                              (let ([powers (in-inclusive-range 2 100)])
                                (stream->list (for*/stream ([a powers] [b powers]) (expt a b)))))])
                           i))
