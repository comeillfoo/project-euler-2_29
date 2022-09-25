#lang racket

(foldl +
       0
       (map (lambda (n) (quotient n n))
            (remove-duplicates (append* (let ([powers (inclusive-range 2 100)])
                                          (for/list ([a powers])
                                            (map (lambda (n) (expt n a)) powers)))))))
