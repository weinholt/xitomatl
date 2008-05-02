#!r6rs
(library (xitomatl smatch)
  (export
    smatch
    smatch-lambda smatch-lambda*
    smatch-let smatch-let*)
  (import
    (rnrs)
    (for (only (xitomatl indexes) enumerate) expand)
    (for (only (xitomatl macro-utils) unique-ids?/raise) expand))
  
  (define-syntax smatch
    (syntax-rules ()
      [(_ expr (pattern fender ... body) ...)
       (let ([obj expr])
         (cond [(smatch-aux obj pattern fender ... (let-values ([vs body]) vs)) 
                => (lambda (vs) (apply values vs))] 
               ...
               [else (assertion-violation 'smatch "failed to match" obj)]))]))
  
  (define-syntax smatch-aux
    ;;; Modified from Phil Bewig's list-match
    ;;; http://groups.google.com/group/comp.lang.scheme/msg/18df0b4cc3939ef0
    (lambda (in-stx)
      (define (underscore? x)
        (and (identifier? x) (free-identifier=? x #'_)))
      (define accum-vars '())
      (define (T stx)
        (syntax-case stx (quote quasiquote)
          [(obj pattern body)
           (T #'(obj pattern #t body))]
          [(obj () fender body)
           #'(and (null? obj) fender body)]
          [(obj underscore fender body)
           (underscore? #'underscore)
           #'(and fender body)]
          [(obj var fender body)
           (and (identifier? #'var)
                (unique-ids?/raise (cons #'var accum-vars) in-stx))
           (begin (set! accum-vars (cons #'var accum-vars))
                  #'(let ([var obj]) (and fender body)))]
          [(obj (quote datum) fender body)
           #'(and (equal? obj (quote datum)) fender body)]
          [(obj (quasiquote datum) fender body)
           #'(and (equal? obj (quasiquote datum)) fender body)]
          [(obj (pat-car . pat-cdr) fender body)
           (with-syntax ([(obj-car obj-cdr) (generate-temporaries '(1 2))])
             #`(and (pair? obj)
                    (let ([obj-car (car obj)] [obj-cdr (cdr obj)])
                      #,(T #`(obj-car pat-car 
                               #,(T #'(obj-cdr pat-cdr fender body)))))))]
          [(obj #(pat* ...) fender body)
           #`(and (vector? obj)
                  (= (vector-length obj) #,(length #'(pat* ...)))
                  #,(if (for-all identifier? #'(pat* ...))
                      (with-syntax ([(idx* ...) (enumerate #'(pat* ...))])
                        #'(let ([pat* (vector-ref obj idx*)] ...)
                            (and fender body)))
                      #`(let ([l (vector->list obj)])
                          #,(T #'(l (pat* ...) fender body)))))]
          [(obj const fender body)
           #'(and (equal? obj const) fender body)]))
      (syntax-case in-stx () [(_ . rest) (T #'rest)])))
  
  (define-syntax smatch-lambda
    (syntax-rules ()
      [(_ clause ...)
       (lambda (x) (smatch x clause ...))]))
  
  (define-syntax smatch-lambda*
    (syntax-rules ()
      [(_ clause ...)
       (lambda x (smatch x clause ...))]))
  
  (define-syntax smatch-let
    (syntax-rules ()
      [(_ ([pat* expr*] ...) body0 body* ...) 
       (smatch (vector expr* ...) 
         [#(pat* ...) 
          (let () body0 body* ...)])]))
  
  (define-syntax smatch-let*
    (syntax-rules ()
      [(_ () body0 body* ...)
       (let () body0 body* ...)]
      [(_ ([pat expr] [pat* expr*] ...) body0 body* ...)
       (smatch expr 
         [pat 
          (smatch-let* ([pat* expr*] ...) body0 body* ...)])]))

)