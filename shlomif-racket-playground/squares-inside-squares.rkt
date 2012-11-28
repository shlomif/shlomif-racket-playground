#lang slideshow
(for ([x (list 1 2 3)])
         (printf "~a~n" x))
(printf "~a~n" (+ 2 3))

(require racket/draw)
; (show-pict (hc-append (scale (rotate (rectangle 200 200) 0.2) 0.5) (rectangle 100 30)))
(define (seq start end)
  (for/list ([i (in-range start end)]) i))

(define (accum-list fn start count)
  (if (= count 0)
      '()
      (cons start (accum-list fn (fn start) (- count 1)))))

(define (my-squares angle-in-degs count)
  (let* ([angle (degrees->radians angle-in-degs)]
         [offset 100]
         [size (* offset 2)]
         [my-inset (lambda (offset pict) (inset pict offset offset))]
         [scale-ratio (sqrt (+ (expt angle 2) (expt (- 1 angle) 2)))]
         [transform (lambda (x) {scale (rotate x angle) scale-ratio})]
         [initial-rect (my-inset (- offset) (rectangle size size))]
         )
    (my-inset offset
      (apply lt-superimpose
              (accum-list transform initial-rect count)))))

(define (showsq a c) (show-pict (my-squares a c)))