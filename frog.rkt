#lang frog/config

;; Called early when Frog launches. Use this to set parameters defined
;; in frog/params.
(define/contract (init)
  (-> any)
  (current-scheme/host "http://yangliang.site")
  (current-title "Gnaily's Blog")
  (current-author "Gnaily"))

;; Called once per post and non-post page, on the contents.
(define/contract (enhance-body xs)
  (-> (listof xexpr/c) (listof xexpr/c))
  ;; Here we pass the xexprs through a series of functions.
  (~> xs
      (syntax-highlight #:python-executable "D:/Programs-develop/Python3.7.2/python.exe"
                        #:line-numbers? #f
                        #:css-class "md-fences md-end-block ty-contain-cm modeLoaded")
      (auto-embed-tweets #:parents? #f)
      (add-racket-doc-links #:code? #f #:prose? #f)))

;; Called from `raco frog --clean`.
(define/contract (clean)
  (-> any)
  (void))
