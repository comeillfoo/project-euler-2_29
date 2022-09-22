#lang racket

(let ([powers (build-list 99 (lambda (n) (+ n 2)))])
  powers)
