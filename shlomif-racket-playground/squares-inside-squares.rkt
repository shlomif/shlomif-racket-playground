#lang slideshow
(for ([x (list 1 2 3)])
         (printf "~a~n" x))
(printf "~a~n" (+ 2 3))

(require racket/draw)
; (show-pict (hc-append (scale (rotate (rectangle 200 200) 0.2) 0.5) (rectangle 100 30)))
(let ([angle (degrees->radians 5)])
(show-pict
    (inset
      (apply lt-superimpose
              (foldl  {lambda (a result)
                  (cons {scale (rotate (car result) angle)
                         (sqrt (+ (expt angle 2) (expt (- 1 angle) 2)))} result)}
               (list (inset (rectangle 200 200) -100 -100)) (for/list ([i (in-range 1 20)]) i))) 100 100)))
