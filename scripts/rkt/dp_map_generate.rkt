#lang racket

(let ([numbers (let ([powers (in-inclusive-range 2 100)])
                 (for*/list ([a powers] [b powers])
                   (expt a b)))])
  (length (map (lambda (x) 1) (remove-duplicates numbers))))
