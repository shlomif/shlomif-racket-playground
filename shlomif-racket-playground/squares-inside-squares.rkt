#lang slideshow
(for ([x (list 1 2 3)])
         (printf "~a~n" x))
(printf "~a~n" (+ 2 3))

(for ([x (list 1 2 3 4 5 6 7 8 9 10)])
  (rectangle 200 200)
  (let ((angle (degrees->radians 30)))
    (rotate angle)
    (scale (sqrt (+ (expt angle 2) (expt (- 1 angle) 2))))))
