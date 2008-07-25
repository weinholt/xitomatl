#!r6rs
(library (xitomatl records)
  (export
    record-type-accessors
    record-type-mutators)
  (import
    (rnrs)
    (only (xitomatl define extras) define/?)
    (only (xitomatl srfi vectors) vector-concatenate))
  
  (define (record-type-field-procs rtd field-proc pred)
    (let loop ([rtd rtd] [procs '()])
      (if rtd
        (loop (record-type-parent rtd)
              (cons (let ([len (vector-length (record-type-field-names rtd))])
                      (let loop ([i (- len 1)] [v (make-vector len)])
                        (cond [(negative? i) v]
                              [else (vector-set! v i
                                     (and (pred rtd i) (field-proc rtd i)))
                                    (loop (- i 1) v)])))
                    procs))
        (vector-concatenate procs))))
  
  (define/? (record-type-accessors [rtd record-type-descriptor?])
    (record-type-field-procs rtd record-accessor (lambda (rtd i) #t)))
  
  (define/? (record-type-mutators [rtd record-type-descriptor?])
    (record-type-field-procs rtd record-mutator 
                             (lambda (rtd i) (record-field-mutable? rtd i))))
  
)
