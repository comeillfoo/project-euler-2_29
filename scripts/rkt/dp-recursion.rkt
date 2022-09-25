#lang racket
(provide distinct-powers)

(require racket/set)

(define (inner-loop init limit b)
  (define a init)
  (if (= a limit) (set (expt a b)) (set-add (inner-loop (add1 a) limit b) (expt a b))))

(define (external-loop init-b init-a limit-b limit-a)
  (define b init-b)
  (if (= b limit-b)
      (inner-loop init-a limit-a b)
      (set-union (external-loop (add1 b) init-a limit-b limit-a) (inner-loop init-a limit-a b))))

(define (distinct-powers left right)
  (if (negative? right)
      (raise (make-exn:fail:contract "Invalid right value passed"))
      (set-count (external-loop left left right right))))

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
