#lang racket

(require rackunit
         "../../scripts/rkt/efn-recursion.rkt")

(check-equal? (even-sum-of-fibonacci-numbers 4000000) 4613732 "Exact task solution")
