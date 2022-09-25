#lang racket

(require rackunit
         "../../scripts/rkt/efn-infinite-lists.rkt")

(check-equal? (stream-fold + 0 (even-fibonacci-numbers-less-than 4000000))
              4613732
              "Exact task solution")
