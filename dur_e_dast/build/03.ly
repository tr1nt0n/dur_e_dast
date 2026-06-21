    \context Score = "Score"
    <<
        \context TimeSignatureContext = "Global Context"
        {
            \tweak text " 1\" " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 1\" " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \break
            \stopMeasureSpanner
            \tweak text " 2\" " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 1\" " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 4\" " \startMeasureSpanner
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
            \tweak text " 4\" " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \break
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 2\" " \startMeasureSpanner
            \time 1/4
            s1 * 1/4
            \noBreak
            \time 1/4
            s1 * 1/4
            \noBreak
            \stopMeasureSpanner
            \tweak text " 3\" " \startMeasureSpanner
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
            \tweak text " 7\" " \startMeasureSpanner
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
            \tweak text " 3\" " \startMeasureSpanner
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
            \tweak text " 3\" " \startMeasureSpanner
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
            - \tweak padding -6
            _ \middle-fermata
            \break
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
                    }
                }
            >>
        >>
    >>
  %! abjad.LilyPondFile._get_format_pieces()
