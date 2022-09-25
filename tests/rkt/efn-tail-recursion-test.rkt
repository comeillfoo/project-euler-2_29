#lang racket

(require rackunit
         "../../scripts/rkt/efn-tail-recursion.rkt")

(check-equal? (even-sum-of-fibonacci-less-than 4000000) 4613732 "Exact task solution")
