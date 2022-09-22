#lang racket

(foldl +
       0
       (map (lambda (n) 1)
            (remove-duplicates (let ([powers (build-list 99 (lambda (n) (+ n 2)))])
                                 (for*/list ([a powers] [b powers])
                                   (expt a b))))))
