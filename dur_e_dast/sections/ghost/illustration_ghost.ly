  %! abjad.LilyPondFile._get_format_pieces()
\version "2.23.81"
  %! abjad.LilyPondFile._get_format_pieces()
\language "english"
  %! abjad.LilyPondFile._get_format_pieces()
\version "2.23.81"
  %! abjad.LilyPondFile._get_format_pieces()
\language "english"
\include "/Users/trintonprater/scores/dur_e_dast/dur_e_dast/build/dur-e-dast-stylesheet.ily"
\include "/Users/trintonprater/abjad/abjad/scm/abjad.ily"
  %! abjad.LilyPondFile._get_format_pieces()
\score
  %! abjad.LilyPondFile._get_format_pieces()
{
    \context Score = "Score"
    <<
        \context TimeSignatureContext = "Global Context"
        {
            \tweak text " 37\" " \startMeasureSpanner
            \time 10/4
            s1 * 5/2
            \break
            \once \override Staff.BarLine.glyph-name = "||" 
            \stopMeasureSpanner
        }
        \context StaffGroup = "Staff Group"
        <<
            \context GrandStaff = "sub group 1"
            <<
                \context Staff = "percussion 1 staff"
                {
                    \context Voice = "percussion 1 voice"
                    {
                        s1 * 5/2
                        \once \override Staff.BarLine.glyph-name = "||" 
                    }
                }
                \context disappearingStaff = "percussion 2 staff"
                {
                    \context Voice = "percussion 2 voice"
                    {
                        s1 * 5/2
                        \once \override Staff.BarLine.glyph-name = "||" 
                    }
                }
            >>
        >>
    >>
  %! abjad.LilyPondFile._get_format_pieces()
}
