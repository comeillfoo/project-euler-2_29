#lang racket
(provide distinct-powers)

(require racket/set)

(define (loop-a limit a b unique)
  (if (> a limit) unique (loop-a limit (add1 a) b (set-add unique (expt a b)))))

(define (loop-b high-limit lower-limit b unique)
  (if (> b high-limit)
      unique
      (loop-b high-limit lower-limit (add1 b) (loop-a high-limit lower-limit b unique))))

(define (distinct-powers left right)
  (if (< right left)
      (raise (make-exn:fail:contract "Invalid parameters passed"))
      (set-count (loop-b right left left (set)))))

(distinct-powers 2 100)

(module+ test
  (require rackunit)
  (check-equal? (distinct-powers 2 100) 9183 "Exact task solution")
  (check-equal? (distinct-powers 1 1) 1 "Single value: 1")
  (check-equal? (distinct-powers 100 100) 1 "Single value: 100^100")
  (check-equal? (distinct-powers 1 2) 3 "Quads with repetitions: {1^1, 1^2, 2^1, 2^2}")
  (check-equal? (distinct-powers 99 100)
                4
                "Quads without repetitions: {99^99, 99^100, 100^99, 100^100}")
  (check-exn exn:fail:contract?
             (lambda ()
               (distinct-powers 2 -1)
               "Exception on right < left")))
