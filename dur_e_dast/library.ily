staff-line-count = #(
    define-music-function (parser location number music) (number? ly:music?)
    #{
    \stopStaff
    \override Staff.StaffSymbol.line-count = #number
    \startStaff
    $music
    #}
    )

boxed-markup = #(
    define-music-function
    (string font-size)
    (string? number?)
    #{
    - \tweak font-size #font-size
    ^ \markup
    \override #'(style . "box")
    \override #'(box-padding . 0.5)
    \whiteout
    \box
    #string
    #}
    )

#(define ((flared-tie coords) grob)

  (define (pair-to-list pair)
     (list (car pair) (cdr pair)))

  (define (normalize-coords goods x y dir)
    (map
      (lambda (coord)
        ;(coord-scale coord (cons x (* y dir)))
        (cons (* x (car coord)) (* y dir (cdr coord))))
      goods))

  (define (my-c-p-s points thick)
    (make-connected-path-stencil
      points
      thick
      1.0
      1.0
      #f
      #f))

  ;; outer let to trigger suicide
  (let ((sten (ly:tie::print grob)))
    (if (grob::is-live? grob)
        (let* ((layout (ly:grob-layout grob))
               (line-thickness (ly:output-def-lookup layout 'line-thickness))
               (thickness (ly:grob-property grob 'thickness 0.1))
               (used-thick (* line-thickness thickness))
               (dir (ly:grob-property grob 'direction))
               (xex (ly:stencil-extent sten X))
               (yex (ly:stencil-extent sten Y))
               (lenx (interval-length xex))
               (leny (interval-length yex))
               (xtrans (car xex))
               (ytrans (if (> dir 0)(car yex) (cdr yex)))
               (uplist
                 (map pair-to-list
                      (normalize-coords coords lenx (* leny 2) dir))))

   (ly:stencil-translate
       (my-c-p-s uplist used-thick)
     (cons xtrans ytrans)))
   '())))

#(define flare-tie
  (flared-tie '((0 . 0)(0.06 . 0.1) (0.94 . 0.1) (1.0 . 0.0))))

#(define ((trinton-blank-time-signature) grob)
   (grob-interpret-markup grob
          (markup #:override '(baseline-skip . 2.5) #:number
                  (#:line ((#:column ("X" "X")))))))

#(define ((three-seven-time-signature) grob)
   (grob-interpret-markup grob
          (markup #:override '(baseline-skip . 2.5) #:number
                  (#:line ((#:column ("3" "7")))))))

#(define ((seven-eighteen-time-signature) grob)
   (grob-interpret-markup grob
          (markup #:override '(baseline-skip . 2.5) #:number
                  (#:line ((#:center-column ("7" "18")))))))

#(define ((three-five-time-signature) grob)
   (grob-interpret-markup grob
          (markup #:override '(baseline-skip . 2.5) #:number
                (  #:line ((#:column ("3" "5")))))))


一 = #(rgb-color 190/255 132/255 170/255)
二 = #(rgb-color 170/255 165/255 230/255)
三 = #(rgb-color 125/255 200/255 240/255)
四 = #(rgb-color 133/255 176/255 147/255)

% #(define-public guerrero-flared-hairpin
%   (elbowed-hairpin '((1.0 . 0.0) (1.45 . 1.0)) - #t))

% U+E078

twisting-clef = \markup {
    \fontsize #14
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \raise #-5
    \rotate #90
    {
        \char ##xe851
    }
}

rasgueado-clef = \markup {
    \fontsize #8.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \override #'(baseline-skip . 0)
    \raise #3
    {
        \center-column {
            % \combine
            \line {
                \char ##xe7e3
            }
            \line {
                \char ##xeb60
            }
            \line {
                \char ##xeb64
            }
            \line {
                \char ##xe7e5
            }
        }
    }
}

string-clef = \markup {
    % \hspace #0.6
    \fontsize #8
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    {
        \raise #1
        \char ##xe078
    }
}

bow-clef = \markup {
    \fontsize #20
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \raise #8.75
    \scale #'(1 . -1)
    {
        \char ##xe7de
    }
}

seven-string-clef = \markup {
    \fontsize #-5
    \raise #2.75
    \override #'(baseline-skip . 1)
    {
        \center-column {
            \line { I }
            \line { II }
            \line { III }
            \line { IV }
            \line { V }
            \line { VI }
            \line { VII }
        }
    }
}

fourteen-string-clef = \markup {
    \fontsize #-6
    \raise #6
    \override #'(baseline-skip . 1)
    {
        \center-column {
            \line { I }
            \line { II }
            \line { III }
            \line { IV }
            \line { V }
            \line { VI }
            \line { VII }
            \line { VIII }
            \line { IX }
            \line { X }
            \line { XI }
            \line { XII }
            \line { XIII }
            \line { XIV }
        }
    }
}

% U+E06B

body-clef = \markup {
    % \hspace #0.6
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \center-column {
        \line {
            \rotate #180
            \fontsize #1
            \raise #2.75
            \char ##xe06b
        }
        \line {
            \rotate #180
            \fontsize #1
            \raise #3.5
            \char ##xe06b
        }
    }
}

back-of-body-clef = \markup {
    % \hspace #0.6
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \center-column {
        \line {
            % \scale #'(-1 . 1)
            \fontsize #1
            \raise #2.75
            \char ##xe06b
        }
        \line {
            % \scale #'(-1 . 1)
            \fontsize #1
            \raise #3.5
            \char ##xe06b
        }
    }
}

% noteheads

#(define-markup-command
    (ekmelos-char layout props point-code)
    (number?)
    (interpret-markup layout props
    #{
    \markup
    \override #'(font-name . "ekmelos")
    \override #'(font-size . 20)
    \char #point-code
    #}))

grace-half-harmonic = {
    \once \override NoteHead.stem-attachment = #(lambda (grob)
        (let* ((thickness (ly:staff-symbol-line-thickness grob))
              (stem (ly:grob-object grob 'stem))
              (dir (ly:grob-property stem 'direction UP)))
          (if (= dir UP)
              (cons
                  0
                  0.9
              )
              (if (= dir DOWN)
                  (cons
                      0
                      -0.9
                  )
              )
          )
        )
    )
    \once \override NoteHead.stencil =
        #(lambda (grob)
            (let
                ((dur (ly:grob-property grob 'duration-log)))
                (if (<= dur 1)
                    (grob-interpret-markup grob (markup #:ekmelos-char #xe0fc))
                    (if (> dur 1)
                        (grob-interpret-markup grob (markup #:ekmelos-char #xe0e3))
                    )
                )
            )
        )
    \once \override NoteHead.font-size = #0.01
}

big-half-harmonic = {
    \once \override NoteHead.stem-attachment = #(lambda (grob)
        (let* ((thickness (ly:staff-symbol-line-thickness grob))
              (stem (ly:grob-object grob 'stem))
              (dir (ly:grob-property stem 'direction UP)))
          (if (= dir UP)
              (cons
                  0
                  0.9
              )
              (if (= dir DOWN)
                  (cons
                      0
                      -0.9
                  )
              )
          )
        )
    )
    \once \override NoteHead.stencil =
        #(lambda (grob)
            (let
                ((dur (ly:grob-property grob 'duration-log)))
                (if (<= dur 1)
                    (grob-interpret-markup grob (markup #:ekmelos-char #xe0fc))
                    (if (> dur 1)
                        (grob-interpret-markup grob (markup #:ekmelos-char #xe0e3))
                    )
                )
            )
        )
    \once \override NoteHead.font-size = #2.5
}

#(define-markup-command (double-box layout props text) (markup?)
  #:properties ((inter-box-padding 0.4)
                (box-padding 0.6))
  (interpret-markup layout props
    #{\markup \override #`(box-padding . ,inter-box-padding) \box
              \override #`(box-padding . ,box-padding) \box
              { #text } #}))

#(define-markup-command (staffBox layout props myWidth myHeight) (number? number?)
    (interpret-markup layout props
      (markup #:line (#:with-dimensions (cons 0 0)(cons 0 0)
        (#:path 0.2
          (list (list (quote moveto) -1.7 1)
          (list (quote lineto) myWidth 1)
          (list (quote lineto) myWidth (* myHeight -1))
          (list (quote lineto) -1.7 (* myHeight -1))
          (list (quote closepath))))))))

% string articulations

spazzolato = \markup {
    \fontsize #4.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \override #'(baseline-skip . 0)
    \circle
    {
        \center-column {
            \combine
            \line {
                % \rotate #180
                \char ##xe27b
            }
            \line {
                \rotate #-180
                \char ##xe27b
            }
        }
    }
}


downward-diagonal-draw = \markup {
    \fontsize #4.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \override #'(baseline-skip . 0)
    \circle
    {
        \center-column {
            \combine
            \line {
                \rotate #-45
                % \raise #1.5
                \char ##xe27b
            }
            \line {
                \rotate #135
                % \lower #1.5
                % \char ##xe27a
                \char ##xe27b
            }
        }
    }
}

normale-draw = \markup {
    \fontsize #4.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \override #'(baseline-skip . 0)
    \circle
    {
        \center-column {
            \combine
            \line {
                \rotate #-90
                \char ##xe27b
            }
            \line {
                \rotate #90
                \char ##xe27b
            }
        }
    }
}

upward-diagonal-draw = \markup {
    \fontsize #4.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    \override #'(baseline-skip . 0)
    \circle
    {
        \center-column {
            \combine
            \line {
                \rotate #-135
                \char ##xe27b
            }
            \line {
                \rotate #45
                \char ##xe27b
            }
        }
    }
}

open-hand = \markup {
    \fontsize #8.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    % \override #'(baseline-skip . 0)
    % \raise #3
    {
        \char ##xe7e3
    }
}

closed-hand = \markup {
    \fontsize #8.5
    \override #'(font-name . "ekmelos")
    \override #'(whiteout-style . "outline")
    \override #'(whiteout . 1)
    \override #'(layer . 27)
    % \override #'(baseline-skip . 0)
    % \raise #3
    {
        \char ##xe7e5
    }
}
