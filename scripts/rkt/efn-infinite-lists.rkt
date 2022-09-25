#lang racket
(provide (all-defined-out))

(require racket/stream)

(define (even-fibonacci-numbers-less-than limit)
  (let loop ([previous 1] [current 1])
    (if (>= current limit)
        empty-stream
        (if (even? current)
            (stream* current (loop current (+ previous current)))
            (loop current (+ previous current))))))

(stream-fold + 0 (even-fibonacci-numbers-less-than 4000000))
