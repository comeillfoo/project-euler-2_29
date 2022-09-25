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
                "Exact task solution")
  (check-true (stream-empty? (even-fibonacci-numbers-less-than -1)) "Empty stream on negative limit")
  (check-true (stream-empty? (even-fibonacci-numbers-less-than 0)) "Empty stream on zero limit")
  (check-true (stream-empty? (even-fibonacci-numbers-less-than 1)) "Empty stream on no even numbers")
  (check-true (stream-empty? (even-fibonacci-numbers-less-than 2))
              "Empty stream on no even numbers with strict limit")
  (check-equal? (stream-length (even-fibonacci-numbers-less-than 3))
                1
                "Single element stream on single even number")
  (check-equal? (stream-length (even-fibonacci-numbers-less-than 9))
                2
                "Two element stream on two even numbers")
  (check-equal? (stream-fold + 0 (even-fibonacci-numbers-less-than 2))
                0
                "Correct sum on no even numbers")
  (check-equal? (stream-fold + 0 (even-fibonacci-numbers-less-than 9))
                10
                "Correct sum on even numbers 2 and 8")
  (check-equal? (stream-fold + 0 (even-fibonacci-numbers-less-than 89))
                44
                "Correct sum on even numbers less than 89"))
