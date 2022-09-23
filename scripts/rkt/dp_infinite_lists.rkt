#lang racket

(require racket/stream)

;;; removes duplicates in stream
(define (stream-uniq lst)
  (if (stream-empty? lst)
      empty-stream
      (stream-cons (stream-first lst)
               (stream-uniq (stream-filter (lambda (x) (not (equal? x (stream-first lst))))
                                           (stream-rest lst))))))

(stream-length (stream-uniq (let ([powers (build-list 99 (lambda (n) (+ n 2)))])
                              (for*/stream ([a powers] [b powers]) (expt a b)))))
