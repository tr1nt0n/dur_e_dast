    \context Score = "Score"
    <<
        \context TimeSignatureContext = "Global Context"
        {
              %! +SCORE
            \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (14)))
            \tweak text " 2 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 3 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 3 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 2 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \break
            \once \override Score.BarLine.extra-offset = #'(0 . 0)
            \once \override Score.SpanBar.extra-offset = #'(0 . 0)
            \stopMeasureSpanner
              %! +SCORE
            \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (6)))
            \tweak text " 11 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \break
            \once \override Score.BarLine.extra-offset = #'(0 . 0)
            \once \override Score.SpanBar.extra-offset = #'(0 . 0)
              %! +SCORE
            \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (4 20)))
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 5 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 3 " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \once \override Score.BarLine.transparent = ##f
            \once \override MultiMeasureRest.transparent = ##t
            \once \override Score.BarLine.extra-offset = #'(0 . 0)
            \once \override Score.SpanBar.extra-offset = #'(0 . 0)
            \once \override Score.TimeSignature.stencil = ##f
            \time 1/4
            R1 * 1/4
            - \tweak font-size #'14
            - \tweak padding -6
            _ \middle-fermata
            \break
            \once \override Score.BarLine.extra-offset = #'(0 . 0)
            \once \override Score.SpanBar.extra-offset = #'(0 . 0)
            \once \override Score.BarLine.transparent = ##f
            \once \override Staff.BarLine.glyph-name = "||" 
        }
        \context StaffGroup = "Staff Group"
        <<
            \context GrandStaff = "sub group 1"
            <<
                \context Staff = "percussion 1 staff"
                {
                    \context Voice = "percussion 1 voice"
                    {
                        \times 2/3
                        {
                            r4
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            g4
                            \p
                            ^ \tenuto
                            - \tweak layer 100
                            - \tweak padding 3
                            ^ \markup \override #'(font-name . " Bodoni72 Book ") \override #'(style . "box") \override #'(box-padding . 0.5) \whiteout \fontsize #2 \box \line { Drum Brushes }
                            (
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #4
                            - \abjad-solid-line-with-arrow
                            - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                            \startTextSpan
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                g16
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e4
                            \stopTextSpan
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #4
                            - \abjad-solid-line-with-arrow
                            - \tweak bound-details.left.text \markup \concat { \drum-center \hspace #0.5 }
                            - \tweak bound-details.right.text \drum-rim
                            \startTextSpan
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                                )
                                \stopTextSpan
                            }
                        }
                        <<
                            \context Voice = "percussion 1 voice temp"
                            {
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 6/10
                                {
                                    \voiceOne
                                    r4
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    g2..
                                      %! abjad.glissando(7)
                                    - \abjad-zero-padding-glissando
                                      %! abjad.glissando(7)
                                    \glissando
                                    - \tweak bound-details.left.Y #0.5
                                    - \tweak bound-details.right.Y #4.5
                                    - \tweak padding #0
                                    - \abjad-solid-line-with-arrow
                                    - \tweak bound-details.left.text \markup \concat { \drum-center \hspace #0.5 }
                                    - \tweak bound-details.right.text \markup {}
                                    \startTextSpan
                                    {
                                        \once \override Accidental.stencil = ##f
                                        \once \override Dots.staff-position = #2
                                        \once \override NoteHead.no-ledgers = ##t
                                        \once \override NoteHead.transparent = ##t
                                          %! abjad.glissando(1)
                                        \hide NoteHead
                                          %! abjad.glissando(1)
                                        \override Accidental.stencil = ##f
                                          %! abjad.glissando(1)
                                        \override NoteColumn.glissando-skip = ##t
                                          %! abjad.glissando(1)
                                        \override NoteHead.no-ledgers = ##t
                                          %! abjad.glissando(6)
                                        \revert Accidental.stencil
                                          %! abjad.glissando(6)
                                        \revert NoteColumn.glissando-skip
                                          %! abjad.glissando(6)
                                        \revert NoteHead.no-ledgers
                                          %! abjad.glissando(6)
                                        \undo \hide NoteHead
                                        g16
                                        \stopTextSpan
                                        - \tweak padding #6.5
                                        - \abjad-dashed-line-with-hook
                                        - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                                        - \tweak bound-details.right.padding -2
                                        \startTextSpanOne
                                    }
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    a'8
                                    ^ \tenuto
                                    ^ \tremolo-articulation
                                      %! abjad.glissando(7)
                                    - \abjad-zero-padding-glissando
                                      %! abjad.glissando(7)
                                    \glissando
                                    {
                                        \once \override Accidental.stencil = ##f
                                        \once \override Dots.staff-position = #2
                                        \once \override NoteHead.no-ledgers = ##t
                                        \once \override NoteHead.transparent = ##t
                                          %! abjad.glissando(1)
                                        \hide NoteHead
                                          %! abjad.glissando(1)
                                        \override Accidental.stencil = ##f
                                          %! abjad.glissando(1)
                                        \override NoteColumn.glissando-skip = ##t
                                          %! abjad.glissando(1)
                                        \override NoteHead.no-ledgers = ##t
                                          %! abjad.glissando(6)
                                        \revert Accidental.stencil
                                          %! abjad.glissando(6)
                                        \revert NoteColumn.glissando-skip
                                          %! abjad.glissando(6)
                                        \revert NoteHead.no-ledgers
                                          %! abjad.glissando(6)
                                        \undo \hide NoteHead
                                        a'16
                                        \laissezVibrer
                                        \stopTextSpanOne
                                    }
                                }
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    r4
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    g4
                                    (
                                      %! abjad.glissando(7)
                                    - \abjad-zero-padding-glissando
                                      %! abjad.glissando(7)
                                    \glissando
                                    - \tweak padding #4.5
                                    - \abjad-solid-line-with-arrow
                                    - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                                    \startTextSpan
                                    {
                                        \once \override Accidental.stencil = ##f
                                        \once \override Dots.staff-position = #2
                                        \once \override NoteHead.no-ledgers = ##t
                                        \once \override NoteHead.transparent = ##t
                                          %! abjad.glissando(1)
                                        \hide NoteHead
                                          %! abjad.glissando(1)
                                        \override Accidental.stencil = ##f
                                          %! abjad.glissando(1)
                                        \override NoteColumn.glissando-skip = ##t
                                          %! abjad.glissando(1)
                                        \override NoteHead.no-ledgers = ##t
                                          %! abjad.glissando(6)
                                        \revert Accidental.stencil
                                          %! abjad.glissando(6)
                                        \revert NoteColumn.glissando-skip
                                          %! abjad.glissando(6)
                                        \revert NoteHead.no-ledgers
                                          %! abjad.glissando(6)
                                        \undo \hide NoteHead
                                        g16
                                        \stopTextSpan
                                        - \tweak padding #4.5
                                        - \abjad-solid-line-with-arrow
                                        - \tweak bound-details.left.text \markup \concat { \drum-center \hspace #0.5 }
                                        - \tweak bound-details.right.text \drum-rim
                                        \startTextSpan
                                    }
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    b4
                                    ^ \tenuto
                                      %! abjad.glissando(7)
                                    - \abjad-zero-padding-glissando
                                      %! abjad.glissando(7)
                                    \glissando
                                    {
                                        \once \override Accidental.stencil = ##f
                                        \once \override Dots.staff-position = #2
                                        \once \override NoteHead.no-ledgers = ##t
                                        \once \override NoteHead.transparent = ##t
                                          %! abjad.glissando(1)
                                        \hide NoteHead
                                          %! abjad.glissando(1)
                                        \override Accidental.stencil = ##f
                                          %! abjad.glissando(1)
                                        \override NoteColumn.glissando-skip = ##t
                                          %! abjad.glissando(1)
                                        \override NoteHead.no-ledgers = ##t
                                          %! abjad.glissando(6)
                                        \revert Accidental.stencil
                                          %! abjad.glissando(6)
                                        \revert NoteColumn.glissando-skip
                                          %! abjad.glissando(6)
                                        \revert NoteHead.no-ledgers
                                          %! abjad.glissando(6)
                                        \undo \hide NoteHead
                                        b16
                                        )
                                        \stopTextSpan
                                    }
                                }
                            }
                            \context Voice = "grass bundle voice"
                            {
                                \voiceTwo
                                r2
                                r8.
                                \once \override Dots.staff-position = #2
                                \afterGrace
                                f'''4.
                                ^ \tremolo-articulation
                                  %! abjad.glissando(7)
                                - \abjad-zero-padding-glissando
                                  %! abjad.glissando(7)
                                \glissando
                                - \tweak font-name "Bodoni72 Book Italic" 
                                - \tweak font-size 2
                                - \tweak padding #11.5
                                - \abjad-dashed-line-with-hook
                                - \tweak bound-details.left.text \markup \concat { { \hspace #-1 { "( shake grass bundle )" } } \hspace #0.5 }
                                - \tweak bound-details.right.padding -0.5
                                \startTextSpanOne
                                {
                                    \once \override Accidental.stencil = ##f
                                    \once \override Dots.staff-position = #2
                                    \once \override NoteHead.no-ledgers = ##t
                                    \once \override NoteHead.transparent = ##t
                                      %! abjad.glissando(1)
                                    \hide NoteHead
                                      %! abjad.glissando(1)
                                    \override Accidental.stencil = ##f
                                      %! abjad.glissando(1)
                                    \override NoteColumn.glissando-skip = ##t
                                      %! abjad.glissando(1)
                                    \override NoteHead.no-ledgers = ##t
                                      %! abjad.glissando(6)
                                    \revert Accidental.stencil
                                      %! abjad.glissando(6)
                                    \revert NoteColumn.glissando-skip
                                      %! abjad.glissando(6)
                                    \revert NoteHead.no-ledgers
                                      %! abjad.glissando(6)
                                    \undo \hide NoteHead
                                    f'''16
                                    \stopTextSpanOne
                                }
                                r4..
                            }
                        >>
                        \oneVoice
                        \times 4/5
                        {
                            r8
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            g4..
                            ^ \tenuto
                            (
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #4
                            - \abjad-solid-line-with-arrow
                            - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                            \startTextSpan
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                g16
                                \stopTextSpan
                                - \tweak padding #4
                                - \abjad-dashed-line-with-hook
                                - \tweak bound-details.left.text \markup \concat { \drum-center \hspace #0.5 }
                                - \tweak bound-details.right.padding -2
                                \startTextSpan
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e16
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                                )
                                \stopTextSpan
                            }
                        }
                        \tweak text #tuplet-number::calc-fraction-text
                        \times 1/1
                        {
                            r2
                            - \tweak layer 100
                            ^ \markup \override #'(font-name . " Bodoni72 Book ") \override #'(style . "box") \override #'(box-padding . 0.5) \whiteout \fontsize #2 \box \line { Styrofoam Blocks }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e4
                            \ppp
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #4.5
                            - \abjad-dashed-line-with-hook
                            - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                            \startTextSpanOne
                            \<
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e4
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e1.
                            \p
                            ^ \tenuto
                            \stopTextSpanOne
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #4.5
                            - \abjad-solid-line-with-arrow
                            - \tweak bound-details.left.text \markup \concat { {} \hspace #0.5 }
                            - \tweak bound-details.right.text \drum-center
                            \startTextSpan
                            - \tweak stencil #constante-hairpin
                            \<
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e4
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                                \stopTextSpan
                            }
                        }
                        \tweak text #tuplet-number::calc-fraction-text
                        \times 1/1
                        {
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            e8
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                e16
                                \!
                            }
                            e4
                            - \accent
                            b16
                            f'16
                        }
                        <<
                            \context Voice = "percussion 1 voice temp 1"
                            {
                                \times 4/5
                                {
                                    \voiceOne
                                    e8.
                                    _ \accent
                                    e8.
                                    _ \accent
                                    \<
                                    b8.
                                    f'8.
                                    a'8.
                                    \mf
                                }
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    b4
                                    _ \accent
                                    b4
                                    _ \accent
                                    b4
                                    _ \accent
                                }
                            }
                            \context Voice = "percussion 1 voice polyrhythm 1"
                            {
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    \voiceTwo
                                    a'4
                                    f'4
                                    g4
                                }
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    a'8.
                                    ^ \accent
                                    a'8.
                                    ^ \accent
                                    a'8.
                                    ^ \accent
                                    a'8.
                                    ^ \accent
                                }
                            }
                        >>
                        \oneVoice
                          %! +SCORE
                        \once \override MultiMeasureRest.transparent = ##t
                          %! +SCORE
                        \once \override Rest.transparent = ##t
                          %! +SCORE
                        \stopStaff \once \override Staff.StaffSymbol.line-count = #0 \startStaff
                        s1 * 1/4
                          %! +SCORE
                        \stopStaff \startStaff
                        \once \override Staff.BarLine.glyph-name = "||" 
                    }
                }
                \context disappearingStaff = "percussion 2 staff"
                {
                    \context Voice = "percussion 2 voice"
                    {
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        s1 * 1/4
                        - \tweak layer 100
                        ^ \markup \override #'(font-name . " Bodoni72 Book ") \override #'(style . "box") \override #'(box-padding . 0.5) \whiteout \fontsize #2 \box \line { Scrubbing Brush }
                        s1 * 1/4
                        \tweak text #tuplet-number::calc-fraction-text
                        \times 1/1
                        {
                            r4
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            b4
                            ^ \tenuto
                            (
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #4
                            - \abjad-solid-line-with-arrow
                            - \tweak bound-details.left.text \markup \concat { \drum-center \hspace #0.5 }
                            \startTextSpan
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                b16
                                \stopTextSpan
                                - \tweak padding #4
                                - \abjad-solid-line-with-arrow
                                - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                                - \tweak bound-details.right.text \drum-center
                                \startTextSpan
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            g4
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                g16
                                )
                                \stopTextSpan
                            }
                        }
                        \times 4/5
                        {
                            r2.
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            a'16.
                            ^ \tenuto
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            - \tweak padding #5
                            - \abjad-solid-line-with-arrow
                            - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                            - \tweak bound-details.right.text \drum-center
                            \startTextSpan
                            _ (
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                a'16
                            }
                            \once \override Dots.staff-position = #2
                            \afterGrace
                            f'16.
                              %! abjad.glissando(7)
                            - \abjad-zero-padding-glissando
                              %! abjad.glissando(7)
                            \glissando
                            {
                                \once \override Accidental.stencil = ##f
                                \once \override Dots.staff-position = #2
                                \once \override NoteHead.no-ledgers = ##t
                                \once \override NoteHead.transparent = ##t
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                  %! abjad.glissando(6)
                                \revert Accidental.stencil
                                  %! abjad.glissando(6)
                                \revert NoteColumn.glissando-skip
                                  %! abjad.glissando(6)
                                \revert NoteHead.no-ledgers
                                  %! abjad.glissando(6)
                                \undo \hide NoteHead
                                f'16
                                )
                                \stopTextSpan
                            }
                        }
                          %! +SCORE
                        \once \override MultiMeasureRest.transparent = ##t
                          %! +SCORE
                        \once \override Rest.transparent = ##t
                          %! +SCORE
                        \stopStaff \once \override Staff.StaffSymbol.line-count = #0 \startStaff
                        s1 * 1/4
                          %! +SCORE
                        \stopStaff \startStaff
                        \once \override Staff.BarLine.glyph-name = "||" 
                    }
                }
            >>
        >>
    >>
  %! abjad.LilyPondFile._get_format_pieces()
