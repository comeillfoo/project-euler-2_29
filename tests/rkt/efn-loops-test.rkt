#lang racket

(require rackunit
         "../../scripts/rkt/efn-loops.rkt")

(check-equal? (sum-of-even-fibonacci-numbers-less-than 4000000) 4613732 "Exact task solution")
