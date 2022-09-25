#lang racket

(require rackunit
         "../../scripts/rkt/dp-infinite-lists.rkt")

(check-equal? (distinct-powers 2 100) 9183 "Exact task solution")
