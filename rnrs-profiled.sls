#!r6rs
;; Copyright 2009 Derick Eddington.  My MIT-style license is in the file named
;; LICENSE from the original collection this file is distributed with.

(library (xitomatl rnrs-profiled)
  (export
    (rename
     (profiled:* *)
     (profiled:+ +)
     (profiled:- -)
     (profiled:/ /)
     (profiled:< <)
     (profiled:<= <=)
     (profiled:= =)
     (profiled:> >)
     (profiled:>= >=)
     (profiled:abs abs)
     (profiled:acos acos)
     (profiled:angle angle)
     (profiled:append append)
     (profiled:apply apply)
     (profiled:asin asin)
     (profiled:assertion-violation assertion-violation)
     (profiled:assertion-violation? assertion-violation?)
     (profiled:assoc assoc)
     (profiled:assp assp)
     (profiled:assq assq)
     (profiled:assv assv)
     (profiled:atan atan)
     (profiled:binary-port? binary-port?)
     (profiled:bitwise-and bitwise-and)
     (profiled:bitwise-arithmetic-shift bitwise-arithmetic-shift)
     (profiled:bitwise-arithmetic-shift-left bitwise-arithmetic-shift-left)
     (profiled:bitwise-arithmetic-shift-right bitwise-arithmetic-shift-right)
     (profiled:bitwise-bit-count bitwise-bit-count)
     (profiled:bitwise-bit-field bitwise-bit-field)
     (profiled:bitwise-bit-set? bitwise-bit-set?)
     (profiled:bitwise-copy-bit bitwise-copy-bit)
     (profiled:bitwise-copy-bit-field bitwise-copy-bit-field)
     (profiled:bitwise-first-bit-set bitwise-first-bit-set)
     (profiled:bitwise-if bitwise-if)
     (profiled:bitwise-ior bitwise-ior)
     (profiled:bitwise-length bitwise-length)
     (profiled:bitwise-not bitwise-not)
     (profiled:bitwise-reverse-bit-field bitwise-reverse-bit-field)
     (profiled:bitwise-rotate-bit-field bitwise-rotate-bit-field)
     (profiled:bitwise-xor bitwise-xor)
     (profiled:boolean=? boolean=?)
     (profiled:boolean? boolean?)
     (profiled:bound-identifier=? bound-identifier=?)
     (profiled:buffer-mode? buffer-mode?)
     (profiled:bytevector->sint-list bytevector->sint-list)
     (profiled:bytevector->string bytevector->string)
     (profiled:bytevector->u8-list bytevector->u8-list)
     (profiled:bytevector->uint-list bytevector->uint-list)
     (profiled:bytevector-copy bytevector-copy)
     (profiled:bytevector-copy! bytevector-copy!)
     (profiled:bytevector-fill! bytevector-fill!)
     (profiled:bytevector-ieee-double-native-ref bytevector-ieee-double-native-ref)
     (profiled:bytevector-ieee-double-native-set! bytevector-ieee-double-native-set!)
     (profiled:bytevector-ieee-double-ref bytevector-ieee-double-ref)
     (profiled:bytevector-ieee-double-set! bytevector-ieee-double-set!)
     (profiled:bytevector-ieee-single-native-ref bytevector-ieee-single-native-ref)
     (profiled:bytevector-ieee-single-native-set! bytevector-ieee-single-native-set!)
     (profiled:bytevector-ieee-single-ref bytevector-ieee-single-ref)
     (profiled:bytevector-ieee-single-set! bytevector-ieee-single-set!)
     (profiled:bytevector-length bytevector-length)
     (profiled:bytevector-s16-native-ref bytevector-s16-native-ref)
     (profiled:bytevector-s16-native-set! bytevector-s16-native-set!)
     (profiled:bytevector-s16-ref bytevector-s16-ref)
     (profiled:bytevector-s16-set! bytevector-s16-set!)
     (profiled:bytevector-s32-native-ref bytevector-s32-native-ref)
     (profiled:bytevector-s32-native-set! bytevector-s32-native-set!)
     (profiled:bytevector-s32-ref bytevector-s32-ref)
     (profiled:bytevector-s32-set! bytevector-s32-set!)
     (profiled:bytevector-s64-native-ref bytevector-s64-native-ref)
     (profiled:bytevector-s64-native-set! bytevector-s64-native-set!)
     (profiled:bytevector-s64-ref bytevector-s64-ref)
     (profiled:bytevector-s64-set! bytevector-s64-set!)
     (profiled:bytevector-s8-ref bytevector-s8-ref)
     (profiled:bytevector-s8-set! bytevector-s8-set!)
     (profiled:bytevector-sint-ref bytevector-sint-ref)
     (profiled:bytevector-sint-set! bytevector-sint-set!)
     (profiled:bytevector-u16-native-ref bytevector-u16-native-ref)
     (profiled:bytevector-u16-native-set! bytevector-u16-native-set!)
     (profiled:bytevector-u16-ref bytevector-u16-ref)
     (profiled:bytevector-u16-set! bytevector-u16-set!)
     (profiled:bytevector-u32-native-ref bytevector-u32-native-ref)
     (profiled:bytevector-u32-native-set! bytevector-u32-native-set!)
     (profiled:bytevector-u32-ref bytevector-u32-ref)
     (profiled:bytevector-u32-set! bytevector-u32-set!)
     (profiled:bytevector-u64-native-ref bytevector-u64-native-ref)
     (profiled:bytevector-u64-native-set! bytevector-u64-native-set!)
     (profiled:bytevector-u64-ref bytevector-u64-ref)
     (profiled:bytevector-u64-set! bytevector-u64-set!)
     (profiled:bytevector-u8-ref bytevector-u8-ref)
     (profiled:bytevector-u8-set! bytevector-u8-set!)
     (profiled:bytevector-uint-ref bytevector-uint-ref)
     (profiled:bytevector-uint-set! bytevector-uint-set!)
     (profiled:bytevector=? bytevector=?)
     (profiled:bytevector? bytevector?)
     (profiled:caaaar caaaar)
     (profiled:caaadr caaadr)
     (profiled:caaar caaar)
     (profiled:caadar caadar)
     (profiled:caaddr caaddr)
     (profiled:caadr caadr)
     (profiled:caar caar)
     (profiled:cadaar cadaar)
     (profiled:cadadr cadadr)
     (profiled:cadar cadar)
     (profiled:caddar caddar)
     (profiled:cadddr cadddr)
     (profiled:caddr caddr)
     (profiled:cadr cadr)
     (profiled:call-with-bytevector-output-port call-with-bytevector-output-port)
     (profiled:call-with-current-continuation call-with-current-continuation)
     (profiled:call-with-input-file call-with-input-file)
     (profiled:call-with-output-file call-with-output-file)
     (profiled:call-with-port call-with-port)
     (profiled:call-with-string-output-port call-with-string-output-port)
     (profiled:call-with-values call-with-values)
     (profiled:call/cc call/cc)
     (profiled:car car)
     (profiled:cdaaar cdaaar)
     (profiled:cdaadr cdaadr)
     (profiled:cdaar cdaar)
     (profiled:cdadar cdadar)
     (profiled:cdaddr cdaddr)
     (profiled:cdadr cdadr)
     (profiled:cdar cdar)
     (profiled:cddaar cddaar)
     (profiled:cddadr cddadr)
     (profiled:cddar cddar)
     (profiled:cdddar cdddar)
     (profiled:cddddr cddddr)
     (profiled:cdddr cdddr)
     (profiled:cddr cddr)
     (profiled:cdr cdr)
     (profiled:ceiling ceiling)
     (profiled:char->integer char->integer)
     (profiled:char-alphabetic? char-alphabetic?)
     (profiled:char-ci<=? char-ci<=?)
     (profiled:char-ci<? char-ci<?)
     (profiled:char-ci=? char-ci=?)
     (profiled:char-ci>=? char-ci>=?)
     (profiled:char-ci>? char-ci>?)
     (profiled:char-downcase char-downcase)
     (profiled:char-foldcase char-foldcase)
     (profiled:char-general-category char-general-category)
     (profiled:char-lower-case? char-lower-case?)
     (profiled:char-numeric? char-numeric?)
     (profiled:char-title-case? char-title-case?)
     (profiled:char-titlecase char-titlecase)
     (profiled:char-upcase char-upcase)
     (profiled:char-upper-case? char-upper-case?)
     (profiled:char-whitespace? char-whitespace?)
     (profiled:char<=? char<=?)
     (profiled:char<? char<?)
     (profiled:char=? char=?)
     (profiled:char>=? char>=?)
     (profiled:char>? char>?)
     (profiled:char? char?)
     (profiled:close-input-port close-input-port)
     (profiled:close-output-port close-output-port)
     (profiled:close-port close-port)
     (profiled:command-line command-line)
     (profiled:complex? complex?)
     (profiled:condition condition)
     (profiled:condition-accessor condition-accessor)
     (profiled:condition-irritants condition-irritants)
     (profiled:condition-message condition-message)
     (profiled:condition-predicate condition-predicate)
     (profiled:condition-who condition-who)
     (profiled:condition? condition?)
     (profiled:cons cons)
     (profiled:cons* cons*)
     (profiled:cos cos)
     (profiled:current-error-port current-error-port)
     (profiled:current-input-port current-input-port)
     (profiled:current-output-port current-output-port)
     (profiled:datum->syntax datum->syntax)
     (profiled:delete-file delete-file)
     (profiled:denominator denominator)
     (profiled:display display)
     (profiled:div div)
     (profiled:div-and-mod div-and-mod)
     (profiled:div0 div0)
     (profiled:div0-and-mod0 div0-and-mod0)
     (profiled:dynamic-wind dynamic-wind)
     (profiled:enum-set->list enum-set->list)
     (profiled:enum-set-complement enum-set-complement)
     (profiled:enum-set-constructor enum-set-constructor)
     (profiled:enum-set-difference enum-set-difference)
     (profiled:enum-set-indexer enum-set-indexer)
     (profiled:enum-set-intersection enum-set-intersection)
     (profiled:enum-set-member? enum-set-member?)
     (profiled:enum-set-projection enum-set-projection)
     (profiled:enum-set-subset? enum-set-subset?)
     (profiled:enum-set-union enum-set-union)
     (profiled:enum-set-universe enum-set-universe)
     (profiled:enum-set=? enum-set=?)
     (profiled:eof-object eof-object)
     (profiled:eof-object? eof-object?)
     (profiled:eq? eq?)
     (profiled:equal-hash equal-hash)
     (profiled:equal? equal?)
     (profiled:eqv? eqv?)
     (profiled:error error)
     (profiled:error? error?)
     (profiled:even? even?)
     (profiled:exact exact)
     (profiled:exact-integer-sqrt exact-integer-sqrt)
     (profiled:exact? exact?)
     (profiled:exists exists)
     (profiled:exit exit)
     (profiled:exp exp)
     (profiled:expt expt)
     (profiled:file-exists? file-exists?)
     (profiled:filter filter)
     (profiled:find find)
     (profiled:finite? finite?)
     (profiled:fixnum->flonum fixnum->flonum)
     (profiled:fixnum-width fixnum-width)
     (profiled:fixnum? fixnum?)
     (profiled:fl* fl*)
     (profiled:fl+ fl+)
     (profiled:fl- fl-)
     (profiled:fl/ fl/)
     (profiled:fl<=? fl<=?)
     (profiled:fl<? fl<?)
     (profiled:fl=? fl=?)
     (profiled:fl>=? fl>=?)
     (profiled:fl>? fl>?)
     (profiled:flabs flabs)
     (profiled:flacos flacos)
     (profiled:flasin flasin)
     (profiled:flatan flatan)
     (profiled:flceiling flceiling)
     (profiled:flcos flcos)
     (profiled:fldenominator fldenominator)
     (profiled:fldiv fldiv)
     (profiled:fldiv-and-mod fldiv-and-mod)
     (profiled:fldiv0 fldiv0)
     (profiled:fldiv0-and-mod0 fldiv0-and-mod0)
     (profiled:fleven? fleven?)
     (profiled:flexp flexp)
     (profiled:flexpt flexpt)
     (profiled:flfinite? flfinite?)
     (profiled:flfloor flfloor)
     (profiled:flinfinite? flinfinite?)
     (profiled:flinteger? flinteger?)
     (profiled:fllog fllog)
     (profiled:flmax flmax)
     (profiled:flmin flmin)
     (profiled:flmod flmod)
     (profiled:flmod0 flmod0)
     (profiled:flnan? flnan?)
     (profiled:flnegative? flnegative?)
     (profiled:flnumerator flnumerator)
     (profiled:flodd? flodd?)
     (profiled:flonum? flonum?)
     (profiled:floor floor)
     (profiled:flpositive? flpositive?)
     (profiled:flround flround)
     (profiled:flsin flsin)
     (profiled:flsqrt flsqrt)
     (profiled:fltan fltan)
     (profiled:fltruncate fltruncate)
     (profiled:flush-output-port flush-output-port)
     (profiled:flzero? flzero?)
     (profiled:fold-left fold-left)
     (profiled:fold-right fold-right)
     (profiled:for-all for-all)
     (profiled:for-each for-each)
     (profiled:free-identifier=? free-identifier=?)
     (profiled:fx* fx*)
     (profiled:fx*/carry fx*/carry)
     (profiled:fx+ fx+)
     (profiled:fx+/carry fx+/carry)
     (profiled:fx- fx-)
     (profiled:fx-/carry fx-/carry)
     (profiled:fx<=? fx<=?)
     (profiled:fx<? fx<?)
     (profiled:fx=? fx=?)
     (profiled:fx>=? fx>=?)
     (profiled:fx>? fx>?)
     (profiled:fxand fxand)
     (profiled:fxarithmetic-shift fxarithmetic-shift)
     (profiled:fxarithmetic-shift-left fxarithmetic-shift-left)
     (profiled:fxarithmetic-shift-right fxarithmetic-shift-right)
     (profiled:fxbit-count fxbit-count)
     (profiled:fxbit-field fxbit-field)
     (profiled:fxbit-set? fxbit-set?)
     (profiled:fxcopy-bit fxcopy-bit)
     (profiled:fxcopy-bit-field fxcopy-bit-field)
     (profiled:fxdiv fxdiv)
     (profiled:fxdiv-and-mod fxdiv-and-mod)
     (profiled:fxdiv0 fxdiv0)
     (profiled:fxdiv0-and-mod0 fxdiv0-and-mod0)
     (profiled:fxeven? fxeven?)
     (profiled:fxfirst-bit-set fxfirst-bit-set)
     (profiled:fxif fxif)
     (profiled:fxior fxior)
     (profiled:fxlength fxlength)
     (profiled:fxmax fxmax)
     (profiled:fxmin fxmin)
     (profiled:fxmod fxmod)
     (profiled:fxmod0 fxmod0)
     (profiled:fxnegative? fxnegative?)
     (profiled:fxnot fxnot)
     (profiled:fxodd? fxodd?)
     (profiled:fxpositive? fxpositive?)
     (profiled:fxreverse-bit-field fxreverse-bit-field)
     (profiled:fxrotate-bit-field fxrotate-bit-field)
     (profiled:fxxor fxxor)
     (profiled:fxzero? fxzero?)
     (profiled:gcd gcd)
     (profiled:generate-temporaries generate-temporaries)
     (profiled:get-bytevector-all get-bytevector-all)
     (profiled:get-bytevector-n get-bytevector-n)
     (profiled:get-bytevector-n! get-bytevector-n!)
     (profiled:get-bytevector-some get-bytevector-some)
     (profiled:get-char get-char)
     (profiled:get-datum get-datum)
     (profiled:get-line get-line)
     (profiled:get-string-all get-string-all)
     (profiled:get-string-n get-string-n)
     (profiled:get-string-n! get-string-n!)
     (profiled:get-u8 get-u8)
     (profiled:greatest-fixnum greatest-fixnum)
     (profiled:hashtable-clear! hashtable-clear!)
     (profiled:hashtable-contains? hashtable-contains?)
     (profiled:hashtable-copy hashtable-copy)
     (profiled:hashtable-delete! hashtable-delete!)
     (profiled:hashtable-entries hashtable-entries)
     (profiled:hashtable-equivalence-function hashtable-equivalence-function)
     (profiled:hashtable-hash-function hashtable-hash-function)
     (profiled:hashtable-keys hashtable-keys)
     (profiled:hashtable-mutable? hashtable-mutable?)
     (profiled:hashtable-ref hashtable-ref)
     (profiled:hashtable-set! hashtable-set!)
     (profiled:hashtable-size hashtable-size)
     (profiled:hashtable-update! hashtable-update!)
     (profiled:hashtable? hashtable?)
     (profiled:i/o-decoding-error? i/o-decoding-error?)
     (profiled:i/o-encoding-error-char i/o-encoding-error-char)
     (profiled:i/o-encoding-error? i/o-encoding-error?)
     (profiled:i/o-error-filename i/o-error-filename)
     (profiled:i/o-error-port i/o-error-port)
     (profiled:i/o-error-position i/o-error-position)
     (profiled:i/o-error? i/o-error?)
     (profiled:i/o-file-already-exists-error? i/o-file-already-exists-error?)
     (profiled:i/o-file-does-not-exist-error? i/o-file-does-not-exist-error?)
     (profiled:i/o-file-is-read-only-error? i/o-file-is-read-only-error?)
     (profiled:i/o-file-protection-error? i/o-file-protection-error?)
     (profiled:i/o-filename-error? i/o-filename-error?)
     (profiled:i/o-invalid-position-error? i/o-invalid-position-error?)
     (profiled:i/o-port-error? i/o-port-error?)
     (profiled:i/o-read-error? i/o-read-error?)
     (profiled:i/o-write-error? i/o-write-error?)
     (profiled:identifier? identifier?)
     (profiled:imag-part imag-part)
     (profiled:implementation-restriction-violation? implementation-restriction-violation?)
     (profiled:inexact inexact)
     (profiled:inexact? inexact?)
     (profiled:infinite? infinite?)
     (profiled:input-port? input-port?)
     (profiled:integer->char integer->char)
     (profiled:integer-valued? integer-valued?)
     (profiled:integer? integer?)
     (profiled:irritants-condition? irritants-condition?)
     (profiled:latin-1-codec latin-1-codec)
     (profiled:lcm lcm)
     (profiled:least-fixnum least-fixnum)
     (profiled:length length)
     (profiled:lexical-violation? lexical-violation?)
     (profiled:list list)
     (profiled:list->string list->string)
     (profiled:list->vector list->vector)
     (profiled:list-ref list-ref)
     (profiled:list-sort list-sort)
     (profiled:list-tail list-tail)
     (profiled:list? list?)
     (profiled:log log)
     (profiled:lookahead-char lookahead-char)
     (profiled:lookahead-u8 lookahead-u8)
     (profiled:magnitude magnitude)
     (profiled:make-assertion-violation make-assertion-violation)
     (profiled:make-bytevector make-bytevector)
     (profiled:make-custom-binary-input-port make-custom-binary-input-port)
     (profiled:make-custom-binary-input/output-port make-custom-binary-input/output-port)
     (profiled:make-custom-binary-output-port make-custom-binary-output-port)
     (profiled:make-custom-textual-input-port make-custom-textual-input-port)
     (profiled:make-custom-textual-input/output-port make-custom-textual-input/output-port)
     (profiled:make-custom-textual-output-port make-custom-textual-output-port)
     (profiled:make-enumeration make-enumeration)
     (profiled:make-eq-hashtable make-eq-hashtable)
     (profiled:make-eqv-hashtable make-eqv-hashtable)
     (profiled:make-error make-error)
     (profiled:make-hashtable make-hashtable)
     (profiled:make-i/o-decoding-error make-i/o-decoding-error)
     (profiled:make-i/o-encoding-error make-i/o-encoding-error)
     (profiled:make-i/o-error make-i/o-error)
     (profiled:make-i/o-file-already-exists-error make-i/o-file-already-exists-error)
     (profiled:make-i/o-file-does-not-exist-error make-i/o-file-does-not-exist-error)
     (profiled:make-i/o-file-is-read-only-error make-i/o-file-is-read-only-error)
     (profiled:make-i/o-file-protection-error make-i/o-file-protection-error)
     (profiled:make-i/o-filename-error make-i/o-filename-error)
     (profiled:make-i/o-invalid-position-error make-i/o-invalid-position-error)
     (profiled:make-i/o-port-error make-i/o-port-error)
     (profiled:make-i/o-read-error make-i/o-read-error)
     (profiled:make-i/o-write-error make-i/o-write-error)
     (profiled:make-implementation-restriction-violation make-implementation-restriction-violation)
     (profiled:make-irritants-condition make-irritants-condition)
     (profiled:make-lexical-violation make-lexical-violation)
     (profiled:make-message-condition make-message-condition)
     (profiled:make-no-infinities-violation make-no-infinities-violation)
     (profiled:make-no-nans-violation make-no-nans-violation)
     (profiled:make-non-continuable-violation make-non-continuable-violation)
     (profiled:make-polar make-polar)
     (profiled:make-record-constructor-descriptor make-record-constructor-descriptor)
     (profiled:make-record-type-descriptor make-record-type-descriptor)
     (profiled:make-rectangular make-rectangular)
     (profiled:make-serious-condition make-serious-condition)
     (profiled:make-string make-string)
     (profiled:make-syntax-violation make-syntax-violation)
     (profiled:make-transcoder make-transcoder)
     (profiled:make-undefined-violation make-undefined-violation)
     (profiled:make-variable-transformer make-variable-transformer)
     (profiled:make-vector make-vector)
     (profiled:make-violation make-violation)
     (profiled:make-warning make-warning)
     (profiled:make-who-condition make-who-condition)
     (profiled:map map)
     (profiled:max max)
     (profiled:member member)
     (profiled:memp memp)
     (profiled:memq memq)
     (profiled:memv memv)
     (profiled:message-condition? message-condition?)
     (profiled:min min)
     (profiled:mod mod)
     (profiled:mod0 mod0)
     (profiled:nan? nan?)
     (profiled:native-endianness native-endianness)
     (profiled:native-eol-style native-eol-style)
     (profiled:native-transcoder native-transcoder)
     (profiled:negative? negative?)
     (profiled:newline newline)
     (profiled:no-infinities-violation? no-infinities-violation?)
     (profiled:no-nans-violation? no-nans-violation?)
     (profiled:non-continuable-violation? non-continuable-violation?)
     (profiled:not not)
     (profiled:null? null?)
     (profiled:number->string number->string)
     (profiled:number? number?)
     (profiled:numerator numerator)
     (profiled:odd? odd?)
     (profiled:open-bytevector-input-port open-bytevector-input-port)
     (profiled:open-bytevector-output-port open-bytevector-output-port)
     (profiled:open-file-input-port open-file-input-port)
     (profiled:open-file-input/output-port open-file-input/output-port)
     (profiled:open-file-output-port open-file-output-port)
     (profiled:open-input-file open-input-file)
     (profiled:open-output-file open-output-file)
     (profiled:open-string-input-port open-string-input-port)
     (profiled:open-string-output-port open-string-output-port)
     (profiled:output-port-buffer-mode output-port-buffer-mode)
     (profiled:output-port? output-port?)
     (profiled:pair? pair?)
     (profiled:partition partition)
     (profiled:peek-char peek-char)
     (profiled:port-eof? port-eof?)
     (profiled:port-has-port-position? port-has-port-position?)
     (profiled:port-has-set-port-position!? port-has-set-port-position!?)
     (profiled:port-position port-position)
     (profiled:port-transcoder port-transcoder)
     (profiled:port? port?)
     (profiled:positive? positive?)
     (profiled:procedure? procedure?)
     (profiled:put-bytevector put-bytevector)
     (profiled:put-char put-char)
     (profiled:put-datum put-datum)
     (profiled:put-string put-string)
     (profiled:put-u8 put-u8)
     (profiled:raise raise)
     (profiled:raise-continuable raise-continuable)
     (profiled:rational-valued? rational-valued?)
     (profiled:rational? rational?)
     (profiled:rationalize rationalize)
     (profiled:read read)
     (profiled:read-char read-char)
     (profiled:real->flonum real->flonum)
     (profiled:real-part real-part)
     (profiled:real-valued? real-valued?)
     (profiled:real? real?)
     (profiled:record-accessor record-accessor)
     (profiled:record-constructor record-constructor)
     (profiled:record-field-mutable? record-field-mutable?)
     (profiled:record-mutator record-mutator)
     (profiled:record-predicate record-predicate)
     (profiled:record-rtd record-rtd)
     (profiled:record-type-descriptor? record-type-descriptor?)
     (profiled:record-type-field-names record-type-field-names)
     (profiled:record-type-generative? record-type-generative?)
     (profiled:record-type-name record-type-name)
     (profiled:record-type-opaque? record-type-opaque?)
     (profiled:record-type-parent record-type-parent)
     (profiled:record-type-sealed? record-type-sealed?)
     (profiled:record-type-uid record-type-uid)
     (profiled:record? record?)
     (profiled:remove remove)
     (profiled:remp remp)
     (profiled:remq remq)
     (profiled:remv remv)
     (profiled:reverse reverse)
     (profiled:round round)
     (profiled:serious-condition? serious-condition?)
     (profiled:set-port-position! set-port-position!)
     (profiled:simple-conditions simple-conditions)
     (profiled:sin sin)
     (profiled:sint-list->bytevector sint-list->bytevector)
     (profiled:sqrt sqrt)
     (profiled:standard-error-port standard-error-port)
     (profiled:standard-input-port standard-input-port)
     (profiled:standard-output-port standard-output-port)
     (profiled:string string)
     (profiled:string->bytevector string->bytevector)
     (profiled:string->list string->list)
     (profiled:string->number string->number)
     (profiled:string->symbol string->symbol)
     (profiled:string->utf16 string->utf16)
     (profiled:string->utf32 string->utf32)
     (profiled:string->utf8 string->utf8)
     (profiled:string-append string-append)
     (profiled:string-ci-hash string-ci-hash)
     (profiled:string-ci<=? string-ci<=?)
     (profiled:string-ci<? string-ci<?)
     (profiled:string-ci=? string-ci=?)
     (profiled:string-ci>=? string-ci>=?)
     (profiled:string-ci>? string-ci>?)
     (profiled:string-copy string-copy)
     (profiled:string-downcase string-downcase)
     (profiled:string-foldcase string-foldcase)
     (profiled:string-for-each string-for-each)
     (profiled:string-hash string-hash)
     (profiled:string-length string-length)
     (profiled:string-normalize-nfc string-normalize-nfc)
     (profiled:string-normalize-nfd string-normalize-nfd)
     (profiled:string-normalize-nfkc string-normalize-nfkc)
     (profiled:string-normalize-nfkd string-normalize-nfkd)
     (profiled:string-ref string-ref)
     (profiled:string-titlecase string-titlecase)
     (profiled:string-upcase string-upcase)
     (profiled:string<=? string<=?)
     (profiled:string<? string<?)
     (profiled:string=? string=?)
     (profiled:string>=? string>=?)
     (profiled:string>? string>?)
     (profiled:string? string?)
     (profiled:substring substring)
     (profiled:symbol->string symbol->string)
     (profiled:symbol-hash symbol-hash)
     (profiled:symbol=? symbol=?)
     (profiled:symbol? symbol?)
     (profiled:syntax->datum syntax->datum)
     (profiled:syntax-violation syntax-violation)
     (profiled:syntax-violation-form syntax-violation-form)
     (profiled:syntax-violation-subform syntax-violation-subform)
     (profiled:syntax-violation? syntax-violation?)
     (profiled:tan tan)
     (profiled:textual-port? textual-port?)
     (profiled:transcoded-port transcoded-port)
     (profiled:transcoder-codec transcoder-codec)
     (profiled:transcoder-eol-style transcoder-eol-style)
     (profiled:transcoder-error-handling-mode transcoder-error-handling-mode)
     (profiled:truncate truncate)
     (profiled:u8-list->bytevector u8-list->bytevector)
     (profiled:uint-list->bytevector uint-list->bytevector)
     (profiled:undefined-violation? undefined-violation?)
     (profiled:utf-16-codec utf-16-codec)
     (profiled:utf-8-codec utf-8-codec)
     (profiled:utf16->string utf16->string)
     (profiled:utf32->string utf32->string)
     (profiled:utf8->string utf8->string)
     (profiled:values values)
     (profiled:vector vector)
     (profiled:vector->list vector->list)
     (profiled:vector-fill! vector-fill!)
     (profiled:vector-for-each vector-for-each)
     (profiled:vector-length vector-length)
     (profiled:vector-map vector-map)
     (profiled:vector-ref vector-ref)
     (profiled:vector-set! vector-set!)
     (profiled:vector-sort vector-sort)
     (profiled:vector-sort! vector-sort!)
     (profiled:vector? vector?)
     (profiled:violation? violation?)
     (profiled:warning? warning?)
     (profiled:who-condition? who-condition?)
     (profiled:with-exception-handler with-exception-handler)
     (profiled:with-input-from-file with-input-from-file)
     (profiled:with-output-to-file with-output-to-file)
     (profiled:write write)
     (profiled:write-char write-char)
     (profiled:zero? zero?))
    ;; everything else from (rnrs)
    &assertion &condition &error &i/o &i/o-decoding
    &i/o-encoding &i/o-file-already-exists
    &i/o-file-does-not-exist &i/o-file-is-read-only
    &i/o-file-protection &i/o-filename &i/o-invalid-position
    &i/o-port &i/o-read &i/o-write &implementation-restriction
    &irritants &lexical &message &no-infinities &no-nans
    &non-continuable &serious &syntax &undefined &violation
    &warning &who ... => _ and assert begin buffer-mode case
    case-lambda cond define define-condition-type
    define-enumeration define-record-type define-syntax do
    else endianness eol-style error-handling-mode fields
    file-options guard identifier-syntax if immutable lambda
    let let* let*-values let-syntax let-values letrec letrec*
    letrec-syntax mutable nongenerative opaque or parent
    parent-rtd protocol quasiquote quasisyntax quote
    record-constructor-descriptor record-type-descriptor
    sealed set! syntax syntax-case syntax-rules unless unquote
    unquote-splicing unsyntax unsyntax-splicing when with-syntax)
  (import
    (rnrs)
    (only (xitomatl profiler srfi-time) define/profiled)  ;; change as desired
    (for (only (xitomatl macro-utils) identifier-append) expand)
    (for (only (xitomatl R6RS-bindings utils) names-of) expand))
  
  (define-syntax define-all
    (lambda (stx)
      (syntax-case stx ()
        ((kw)
         (with-syntax ((((profiled:n r:n) ...)
                        (map (lambda (id)
                               (list (identifier-append #'kw 'profiled: id)
                                     (datum->syntax #'kw id)))
                             (names-of '(rnrs) 'procedures))))
           #'(begin
               (define/profiled (profiled:n . a) (apply r:n a))
               ...))))))
  
  (define-all)
)
