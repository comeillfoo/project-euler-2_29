#lang racket
(provide even-fibonacci-numbers-less-than)

(require racket/stream)

(define (even-fibonacci-numbers-less-than limit)
  (let loop ([previous 1] [current 1])
    (if (>= current limit)
        empty-stream
        (if (even? current)
            (stream* current (loop current (+ previous current)))
            (loop current (+ previous current))))))

(stream-fold + 0 (even-fibonacci-numbers-less-than 4000000))

(module+ test
  (require rackunit)
  (check-equal? (stream-fold + 0 (even-fibonacci-numbers-less-than 4000000))
                4613732
                "Exact task solution"))
