#lang racket

(foldl +
       0
       (map (lambda (n) 1)
            (remove-duplicates (flatten (let ([powers (inclusive-range 2 100)])
                                          (for/list ([a powers])
                                            (map (lambda (n) (expt n a)) powers)))))))
