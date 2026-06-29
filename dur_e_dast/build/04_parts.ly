    \context Score = "Score"
    <<
        \context TimeSignatureContext = "Global Context"
        {
              %! +SCORE
        %%% \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (12.5)))
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
            \tweak text " 4 " \startMeasureSpanner
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
            \tweak text " 4 " \startMeasureSpanner
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
        %%% \once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (11.5)))
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
            \once \override Score.TimeSignature.stencil = ##f
            \time 1/4
            R1 * 1/4
            - \tweak font-size #'14
            - \tweak padding -10
            _ \very-long-fermata
            \noBreak
            \once \override Score.BarLine.transparent = ##f
            \once \override Score.BarLine.transparent = ##f
            \once \override MultiMeasureRest.transparent = ##t
            \once \override Score.BarLine.extra-offset = #'(0 . 0)
            \once \override Score.SpanBar.extra-offset = #'(0 . 0)
            \once \override Score.TimeSignature.stencil = ##f
            \time 1/4
            R1 * 1/4
            - \tweak font-size #'14
            - \tweak padding -6
            _ \extremely-long-fermata
            \noBreak
            \once \override Score.BarLine.transparent = ##f
            \once \override Staff.BarLine.glyph-name = "|." 
        }
        \context StaffGroup = "Staff Group"
        <<
            \context GrandStaff = "sub group 1"
            <<
                \context Staff = "percussion 1 staff"
                {
                    \context Voice = "percussion 1 voice"
                    {
                        <<
                            \context Voice = "percussion 1 voice temp"
                            {
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    \once \override Dots.staff-position = #2
                                    \voiceTwo
                                    \afterGrace
                                    f'4
                                    \pp
                                    - \tweak layer 100
                                    - \tweak padding 4
                                    ^ \markup \override #'(font-name . " Bodoni72 Book ") \override #'(style . "box") \override #'(box-padding . 0.5) \whiteout \fontsize #2 \box \line { Drum Brushes }
                                      %! abjad.glissando(7)
                                    - \abjad-zero-padding-glissando
                                      %! abjad.glissando(7)
                                    \glissando
                                    - \tweak padding #5
                                    - \abjad-dashed-line-with-hook
                                    - \tweak bound-details.left.text \markup \concat { \drum-rim \hspace #0.5 }
                                    - \tweak bound-details.right.padding -1
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
                                        f'16
                                    }
                                    d'8
                                    \times 2/3
                                    {
                                        a'8
                                        f'16
                                        f'8
                                        f'16
                                    }
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    f'8
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
                                    }
                                }
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    b4
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
                                    }
                                    \times 2/3
                                    {
                                        f'4
                                        a'8
                                        a'8
                                        f'4
                                    }
                                    g4
                                }
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    a'4
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
                                    }
                                    \times 2/3
                                    {
                                        f'4
                                        f'4
                                        f'8
                                        f'8
                                    }
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    f'4
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
                                    }
                                }
                                \tweak text #tuplet-number::calc-fraction-text
                                \times 1/1
                                {
                                    g4
                                    b4
                                    \once \override Dots.staff-position = #2
                                    \afterGrace
                                    b4
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
                                        b16
                                        \stopTextSpanOne
                                    }
                                }
                                s1 * 1/4
                            }
                            \context Voice = "grass bundle voice"
                            {
                                \voiceOne
                                r1....
                                \once \override Dots.staff-position = #2
                                d'''1..
                                ^ \tremolo-articulation
                                  %! abjad.glissando(7)
                                - \abjad-zero-padding-glissando
                                  %! abjad.glissando(7)
                                \glissando
                                - \tweak font-name "Bodoni72 Book Italic" 
                                - \tweak font-size 2
                                - \tweak padding #10.5
                                - \abjad-dashed-line-with-hook
                                - \tweak bound-details.left.text \markup \concat { { \hspace #-1 { "( shake grass bundle )" } } \hspace #0.5 }
                                - \tweak bound-details.right.padding -1
                                \startTextSpanOne
                                ~
                                \once \override Dots.staff-position = #2
                                  %! abjad.glissando(1)
                                \hide NoteHead
                                  %! abjad.glissando(1)
                                \override Accidental.stencil = ##f
                                  %! abjad.glissando(1)
                                \override NoteColumn.glissando-skip = ##t
                                  %! abjad.glissando(1)
                                \override NoteHead.no-ledgers = ##t
                                \afterGrace
                                d'''16
                                {
                                    \once \override Accidental.stencil = ##f
                                    \once \override Dots.staff-position = #2
                                    \once \override NoteHead.no-ledgers = ##t
                                    \once \override NoteHead.transparent = ##t
                                      %! abjad.glissando(6)
                                    \revert Accidental.stencil
                                      %! abjad.glissando(6)
                                    \revert NoteColumn.glissando-skip
                                      %! abjad.glissando(6)
                                    \revert NoteHead.no-ledgers
                                      %! abjad.glissando(6)
                                    \undo \hide NoteHead
                                    d'''16
                                    \stopTextSpanOne
                                }
                            }
                        >>
                        \oneVoice
                          %! +SCORE
                    %%% \once \override MultiMeasureRest.transparent = ##t
                          %! +SCORE
                    %%% \once \override Rest.transparent = ##t
                          %! +SCORE
                    %%% \stopStaff \once \override Staff.StaffSymbol.line-count = #0 \startStaff
                        s1 * 1/4
                        - \tweak X-extent ##f
                        _ \markup \fontsize #1 \lower #7 { \hspace #1.75 \right-column \override #'(font-name . "Bodoni72 Book Italic") { \line { June - August 2026 } \line { Schöppingen, DE - Ithaca, NY } } }
                          %! +SCORE
                    %%% \stopStaff \startStaff
                        \once \override Staff.BarLine.glyph-name = "|." 
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
                          %! +SCORE
                    %%% \once \override MultiMeasureRest.transparent = ##t
                          %! +SCORE
                    %%% \once \override Rest.transparent = ##t
                          %! +SCORE
                    %%% \stopStaff \once \override Staff.StaffSymbol.line-count = #0 \startStaff
                        s1 * 1/4
                          %! +SCORE
                    %%% \stopStaff \startStaff
                        \once \override Staff.BarLine.glyph-name = "|." 
                    }
                }
            >>
        >>
    >>
  %! abjad.LilyPondFile._get_format_pieces()
