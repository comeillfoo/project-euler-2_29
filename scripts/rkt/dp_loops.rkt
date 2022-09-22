#lang racket

(for/fold ([length 0])
          ([distinct_powers
            (for/fold ([acc '()])
                      ([a_b (let ([powers (build-list 99 (lambda (n) (+ n 2)))])
                              (for*/list ([a powers] [b powers])
                                (expt a b)))])
              (if (= (length (filter (lambda (x) (equal? x a_b)) acc)) 0) (list* a_b acc) acc))])
  (add1 length))
