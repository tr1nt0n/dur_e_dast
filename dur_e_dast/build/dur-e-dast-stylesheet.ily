\version "2.23.81"
\language english
#(set-default-paper-size '(cons (* 12 in) (* 9 in)))
#(set-global-staff-size 17)
#(ly:set-option 'relative-includes #t)

\include "../library.ily"
\include "/Users/trintonprater/evans/lilypond/evans.ily"
\include "/Users/trintonprater/trinton/lilypond/trinton-markups.ily"
\include "/Users/trintonprater/trinton/lilypond/trinton-spanners.ily"
\include "/Users/trintonprater/abjad-ext-microtones/abjadext/microtones/lilypond/ekmelos-ji-accidental-markups.ily"

\header {
    dedication = \markup \column {\line \override #'(font-name . "Bodoni72 Book Italic") { \fontsize #2 { "to" \override #'(font-name . "Bodoni72 Book") "Miedya" } \line { \fontsize #0.01 \with-color #white "."} } }
    title = \markup \override #'(font-name . "Bodoni72 Book Italic") \center-column { \line \fontsize #14 { "dūr-e-dest | du redest" } \fontsize #0.01 \with-color #white "."}
    subtitle = \markup \fontsize #2 \center-column { \line { \override #'(font-name . "Bodoni72 Book Italic") { "( three seats )" } } \fontsize #0.01 \with-color #white "."}
    composer = \markup \column { \override #'(font-name . "Bodoni72") \fontsize #2 {"Trinity Hlynn Prater (*2000)"} \fontsize #30 \with-color #white "."}
}

afterGraceFraction = #(cons 15 16)

\layout {
    \accidentalStyle neo-modern
    ragged-bottom = ##t
    ragged-last = ##t
    ragged-right = ##t
    \context {
        \name TimeSignatureContext
        \numericTimeSignature
        \type Engraver_group
        \consists Axis_group_engraver
        \consists Bar_number_engraver
        \consists Time_signature_engraver
		\consists Mark_engraver
        \consists Measure_spanner_engraver
		\consists Metronome_mark_engraver
        \consists Multi_measure_rest_engraver
		\consists Text_engraver
		\consists Text_spanner_engraver

        \override BarNumber.stencil = #(make-stencil-circler 0.1 0.75 ly:text-interface::print)
        \override BarNumber.Y-extent = ##f
        \override BarNumber.Y-offset = 7
        \override BarNumber.X-extent = ##f
        \override BarNumber.X-offset = 0
        \override BarNumber.font-size = 1
        \override BarNumber.padding = 1
        \override BarNumber.font-name = "Bodoni72 Book"
        \override BarNumber.break-visibility = #end-of-line-invisible

        \override MetronomeMark.stencil = ##f
        \override VerticalAxisGroup.staff-staff-spacing = #'((basic-distance . 0) (minimum-distance . 0) (padding . 0) (stretchability . 0))
        % \override TimeSignature.transparent = ##t
        \override TimeSignature.font-size = 10
		\override TimeSignature.font-name = "Bodoni72 Book"
        % \override TimeSignature.X-extent = #'(0 . 0)
        \override TimeSignature.X-extent = ##f
        \override TimeSignature.X-offset = -2
        \override TimeSignature.whiteout-style = #'outline
        \override TimeSignature.whiteout = 1
        \override TimeSignature.layer = 4
        \override TimeSignature.break-visibility = #end-of-line-invisible
        \override TimeSignature.transparent = ##t
        % \override TimeSignature.font-size = 10
		% \override TimeSignature.font-name = "Bodoni72 Book"
        % \override TimeSignature.X-offset = -2.5
        % \override TimeSignature.Y-offset = 13
    }

    \context {
        \Score
        \numericTimeSignature
        \accepts TimeSignatureContext
        \consists Grid_line_span_engraver
        % \consists Measure_spanner_engraver
        \remove Bar_number_engraver
        proportionalNotationDuration = #(ly:make-moment 1 30)
        pedalSustainStyle = #'mixed

        \override StaffGrouper.staffgroup-staff-spacing = #'((basic-distance . 7) (minimum distance . 7) (padding . 7) (stretchability . 0))
        \override StaffGrouper.staff-staff-spacing = #'((basic-distance . 7) (minimum distance . 7) (padding . 7) (stretchability . 0))

        \override AccidentalSuggestion.avoid-slur = #'ignore
        \override Accidental.layer = 3
        \override Accidental.whiteout-style = #'outline
        \override Accidental.whiteout = 1
        % \override Accidental.X-extent = ##f

        % \override Arpeggio.stencil = #ly:arpeggio::brew-chord-bracket
        \override Arpeggio.whiteout-style = #'outline
        \override Arpeggio.whiteout = 1
        \override Arpeggio.layer = 2

        \override Script.layer = 2
        \override Script.whiteout-style = #'outline
        \override Script.whiteout = 1

        \override BarLine.hair-thickness = 1.5
        \override BarLine.thick-thickness = #10
        \override BarLine.layer = 2
        \override BarLine.glyph-name = "!"
        \override BarLine.bar-extent = #'(-3 . 3)
        \override BarLine.extra-offset = #'(1.55 . 0)

        autoBeaming = ##f
        % \override Beam.breakable = ##t
        % \override Beam.damping = 2
        % \override Beam.concaveness = #10000
        % \override Beam.beam-thickness = #1.15
        % \override Beam.length-fraction = #1.84
        \override Beam.stencil = ##f

        \override BendAfter.thickness = #3

        \override BreathingSign.text = \markup {
            \fontsize #7.5
            \override #'(font-name . "ekmelos")
            \char ##xe4D5
        }

        \override Clef.layer = 2
        \override Clef.whiteout-style = #'outline
        \override Clef.whiteout = 1

        \override Dots.stencil = ##f

        \override DynamicText.font-size = #-0.75
        \override DynamicText.layer = 2
        \override DynamicText.whiteout-style = #'outline
        \override DynamicText.whiteout = 1
        \override DynamicLineSpanner.staff-padding = 4

        \override Flag.stencil = ##f

        \override Glissando.thickness = #4
        \override Glissando.breakable = ##t

        \override Hairpin.to-barline = ##f

        \override KeySignature.layer = 2
        \override KeySignature.whiteout-style = #'outline
        \override KeySignature.whiteout = 1

        \override MeasureSpanner.direction = #UP
        \override MeasureSpanner.thickness = #1.5
        \override MeasureSpanner.font-size = 2
        \override MeasureSpanner.font-name = "Bodoni72 Book"
        \override MeasureSpanner.padding = 4
        \override MeasureSpanner.X-extent = ##f
        \override MeasureSpanner.shorten-pair = #'(1.54 . -1.56)

        \override MetronomeMark.stencil = ##f

        \override NoteHead.style = #'la
        \override NoteHead.duration-log = 2

        \override NoteCollision.merge-differently-dotted = ##t
        \override NoteCollision.merge-differently-headed = ##t

        \override OttavaBracket.layer = 2
        \override OttavaBracket.whiteout-style = #'outline
        \override OttavaBracket.whiteout = 1

        \override Parentheses.font-size = #1

        \override PianoPedalBracket.shorten-pair = #'(0 . -4)

        \override SpacingSpanner.strict-note-spacing = ##t
        \override SpacingSpanner.uniform-stretching = ##t

        \override Staff.thickness = #0.5

        \override StaffSymbol.width = #190.7
        \override StaffSymbol.line-count = #6

        \override Stem.stencil = ##f

        % \override StemTremolo.stencil = #ly:text-interface::print
        % \override StemTremolo.text = \markup {
        %     \fontsize #3.5
        %     \override #'(font-name . "ekmelos")
        %     \lower #1
        %     {
        %         \char ##xe222
        %     }
        % }
        \override StemTremolo.whiteout-style = #'outline
        \override StemTremolo.whiteout = 1
        \override StemTremolo.layer = 2
        \override StemTremolo.beam-width = 1.5
        \override StemTremolo.flag-count = 3
        \override StemTremolo.slope = 0.5

        \override TextScript.font-name = "Bodoni72 Book"
        \override TextScript.whiteout-style = #'outline
        \override TextScript.whiteout = 1
        \override TextSpanner.font-name = "Bodoni72 Book"

        \override Tie.stencil = #flare-tie
        \override Tie.height-limit = 6
        \override Tie.thickness = 1.5

        \override TrillSpanner.bound-details.right.padding = #-3

        \shape #'((0 . 0) (0.5 . 0) (1 . 0) (2 . 0)) LaissezVibrerTie
        \override LaissezVibrerTie.X-extent = ##f

        % \shape #'((-2 . 0) (-1 . 0) (-0.5 . 0) (0 . 0)) RepeatTie
        % \override RepeatTie.X-extent = ##f

        \override TrillPitchAccidental.avoid-slur = #'ignore

        \override TupletBracket.stencil = ##f
        \override TupletNumber.stencil = ##f

        \override VoltaBracketSpanner.padding = 8
    }

    \context {
        \Staff
        fontSize = #0
        \remove Time_signature_engraver
        \consists Duration_line_engraver
        \consists Grid_point_engraver
        \consists Grob_pq_engraver
        \consists #Interrupt_heads_engraver

        % \override Accidental.X-extent = ##f

        \clef percussion

        \override AccidentalSuggestion.direction = #UP
        \override AccidentalSuggestion.font-size = 0.2
        \override AccidentalSuggestion.whiteout-style = #'outline
        \override AccidentalSuggestion.whiteout = 1
        \override AccidentalSuggestion.layer = 2
        % \override AccidentalSuggestion.parent-alignment-X = -1
        % \override AccidentalSuggestion.X-extent = #'(0 . 0)

        \override DurationLine.style = #'line
        \override DurationLine.thickness = #3
        \override DurationLine.to-barline = ##f
        \override DurationLine.breakable = ##t

        \override InstrumentName.self-alignment-X = #CENTER

        % \override TimeSignature.font-size = 1
        % \override TimeSignature.whiteout-style = #'outline
        % \override TimeSignature.whiteout = 1
        % \override TimeSignature.layer = 4
        % \RemoveAllEmptyStaves
        % \RemoveEmptyStaves
    }

    \context{
        \Staff
        \name disappearingStaff
        \alias Staff

        \RemoveAllEmptyStaves
    }

    \context{
        \GrandStaff
        % \remove Time_signature_engraver
        \accepts disappearingStaff
        \consists Grob_pq_engraver
        % \consists Measure_spanner_engraver

        \consists #Interrupt_heads_engraver
        \consists #Explicit_interrupt_heads_engraver
        \consists #Follow_lines_engraver
        \consists #Switch_heads_engraver
        \consists #Hocket_lines_engraver
        \override VoiceFollower.layer = -20
    }

    \context {
        \Voice
        \remove Forbid_line_break_engraver
        \consists Measure_spanner_engraver

        \override Accidental.font-size = 2
    }

}
%
\paper {
    #(define fonts
        (set-global-fonts
	        #:music "haydn"
	        #:brace "haydn"
	))
    min-systems-per-page = 1
    % max-systems-per-page = 3
    system-separator-markup = \markup \fontsize #12 { \tremolo-moderato }
    system-system-spacing = #'((basic-distance . 30) (minimum-distance . 30) (padding . 0) (stretchability . 30))
    indent = 5\mm
    short-indent = 5\mm
    bottom-margin = 10\mm
    left-margin = 10\mm
    right-margin = 10\mm
    top-margin = 30\mm

    oddHeaderMarkup = \markup ""
    evenHeaderMarkup = \markup ""

    oddFooterMarkup = \markup
        \fill-line {
            \concat {
                \fontsize #2
                {
                    \override #'(font-name . "Bodoni72 Book Italic")
                    "dūr-e-dest | du redest"
                    \override #'(font-name . "Bodoni72 Book")
                    " - Trinity Hlynn Prater"
                }
            }
            \concat {
                \fontsize #2
                \override #'(font-name . "Bodoni72 Book")
                    \fromproperty #'page:page-number-string
            }
        }

    evenFooterMarkup = \markup
        \fill-line {
            \concat {
                \fontsize #2
                \override #'(font-name . "Bodoni72 Book")
                    \fromproperty #'page:page-number-string
            }
            \concat {
                \fontsize #2
                {
                    \override #'(font-name . "Bodoni72 Book Italic")
                    "dūr-e-dest | du redest"
                    \override #'(font-name . "Bodoni72 Book")
                    " - Trinity Hlynn Prater"
                }
            }
        }
}
