#lang racket

(require rackunit
         "../../scripts/rkt/efn-module.rkt")

(check-equal? (foldl + 0 (filter even? (fibonacci-numbers-less-than 4000000)))
              4613732
              "Exact task solution")
