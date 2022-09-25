#lang racket

(require rackunit
         "../../scripts/rkt/dp-map-generate.rkt")

(check-equal? (distinct-powers 2 100) 9183 "Exact task solution")
