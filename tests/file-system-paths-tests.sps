;;; Copyright (c) 2008 Derick Eddington
;;;
;;; Permission is hereby granted, free of charge, to any person obtaining a
;;; copy of this software and associated documentation files (the "Software"),
;;; to deal in the Software without restriction, including without limitation
;;; the rights to use, copy, modify, merge, publish, distribute, sublicense,
;;; and/or sell copies of the Software, and to permit persons to whom the
;;; Software is furnished to do so, subject to the following conditions:
;;;
;;; The above copyright notice and this permission notice shall be included in
;;; all copies or substantial portions of the Software.
;;;
;;; Except as contained in this notice, the name(s) of the above copyright
;;; holders shall not be used in advertising or otherwise to promote the sale,
;;; use or other dealings in this Software without prior written authorization.
;;;
;;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
;;; THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
;;; DEALINGS IN THE SOFTWARE.

#!r6rs
(import
  (rnrs)
  (xitomatl file-system paths)
  (srfi :78 lightweight-testing))

(check (absolute-path? "")
       => #f)
(check (absolute-path? "a")
       => #f)
(check (absolute-path? " a ")
       => #f)
(check (absolute-path? "a/ b")
       => #f)
(check (absolute-path? "a// //b")
       => #f)
(check (absolute-path? "a////b///")
       => #f)
(check (absolute-path? "/")
       => #t)
(check (absolute-path? "///// //")
       => #t)
(check (absolute-path? "/a")
       => #t)
(check (absolute-path? "/a/b")
       => #t)
(check (absolute-path? "//a/b")
       => #t)
(check (absolute-path? "/////a //b//")
       => #t)

(check (relative-path? "")
       => #f)
(check (relative-path? " ")
       => #t)
(check (relative-path? " a ")
       => #t)
(check (relative-path? "a/b")
       => #t)
(check (relative-path? "a// // b ")
       => #t)
(check (relative-path? "a////b///")
       => #t)
(check (relative-path? "/")
       => #f)
(check (relative-path? "///// //")
       => #f)
(check (relative-path? "/a")
       => #f)
(check (relative-path? "/a/b")
       => #f)
(check (relative-path? "//a/b")
       => #f)
(check (relative-path? "/////a //b//")
       => #f)

(check (path-join)
       => "")
(check (path-join "a")
       => "a")
(check (path-join "/")
       => "/")
(check (path-join "/" "a")
       => "/a")
(check (path-join "/a")
       => "/a")
(check (path-join " " "a")
       => " /a")
(check (path-join "" "a")
       => "a")
(check (path-join "" "/a")
       => "a")
(check (path-join "a" "b")
       => "a/b")
(check (path-join "a" "" "b" "")
       => "a/b")
(check (path-join "" "a" "b")
       => "a/b")
(check (path-join "a/b")
       => "a/b")
(check (path-join "/a/b")
       => "/a/b")
(check (path-join "" "/a/b")
       => "a/b")
(check (path-join "//a///b")
       => "/a/b")
(check (path-join "a " " b")
       => "a / b")
(check (path-join "/a" "b")
       => "/a/b")
(check (path-join "/" "a" "b")
       => "/a/b")
(check (path-join "/" "a/b")
       => "/a/b")
(check (path-join "/////a/////" "b" "c")
       => "/a/b/c")
(check (path-join "" "/////a/////" "b" "c")
       => "a/b/c")
(check (path-join "/////a/////" "/b/" "c////")
       => "/a/b/c")
(check (path-join "" "/////a/////" "///b" "///c")
       => "a/b/c")
(check (path-join "a" "b" "c" "d" "e" "f")
       => "a/b/c/d/e/f")
(check (path-join "a" "b/c/d" "e/f")
       => "a/b/c/d/e/f")
(check (path-join "a" "/b//c///d" "e//////f")
       => "a/b/c/d/e/f")
(check (path-join "/a" "b" "c" "d" "e" "f")
       => "/a/b/c/d/e/f")
(check (path-join "//////" "a" "b" "c" "d" "e" "f")
       => "/a/b/c/d/e/f")
(check (path-join "//////" "//////a" "b////////" "c/" "/d//" "//e" "f////////////////")
       => "/a/b/c/d/e/f")
(check (path-join "/// ///" "//////a" "b b////////" "c/" "/d//" "//e" "f////////////////  ")
       => "/ /a/b b/c/d/e/f/  ")

(check (path-split "")
       => '())
(check (path-split "/")
       => '("/"))
(check (path-split "a")
       => '("a"))
(check (path-split "ab cd")
       => '("ab cd"))
(check (path-split "a/b")
       => '("a" "b"))
(check (path-split "aa a/b bb bbb")
       => '("aa a" "b bb bbb"))
(check (path-split "/a/b")
       => '("/" "a" "b"))
(check (path-split " /a/b")
       => '(" " "a" "b"))
(check (path-split " /a / b")
       => '(" " "a " " b"))
(check (path-split "//// a / b bbbbb ")
       => '("/" " a " " b bbbbb "))

(check (cleanse-path "")
       => "")
(check (cleanse-path "/")
       => "/")
(check (cleanse-path "//")
       => "/")
(check (cleanse-path "////////////")
       => "/")
(check (cleanse-path "a")
       => "a")
(check (cleanse-path "ab cd")
       => "ab cd")
(check (cleanse-path "a/b")
       => "a/b")
(check (cleanse-path "a//b")
       => "a/b")
(check (cleanse-path "a/b/")
       => "a/b")
(check (cleanse-path "a/////////////b")
       => "a/b")
(check (cleanse-path "a////b//////")
       => "a/b")
(check (cleanse-path "aa a/b bb bbb")
       => "aa a/b bb bbb")
(check (cleanse-path "/a/b")
       => "/a/b")
(check (cleanse-path " /a/b")
       => " /a/b")
(check (cleanse-path "//a")
       => "/a")
(check (cleanse-path "//////a//////")
       => "/a")
(check (cleanse-path "//////a////bb//ccc///////dddd/eeeee//")
       => "/a/bb/ccc/dddd/eeeee")

(check (path=? "/" "//" "///") 
       => #t)
(check (path=? "/a" "////a" "//a/") 
       => #t)
(check (path=? "//////a////bb//ccc///////dddd/eeeee//"
               "/a/bb/ccc/dddd/eeeee"
               "///a/bb///ccc///dddd//eeeee") 
       => #t)
(check (path=? "a/bb/ccc/" "a//bb///ccc") 
       => #t)
(check (path=? "a/bb/ccc/" "a//bb///ccc" "a///bb//ccc" "a//bb///ccc/" "a//bb///ccc//" 
               "a//bb///ccc" "a//bb///ccc" "a/bb/ccc" "a//bb//ccc" "a/bb/ccc/") 
       => #t)


(check-report)
