import abjad
from abjadext import rmakers
import baca
import evans
import trinton
import itertools
from dur_e_dast import library
from dur_e_dast import material_sequence
from dur_e_dast import rhythm
from dur_e_dast import ts

# score

score = library.dur_e_dast_score([(10, 4)])

# music

# trinton.make_music(
#     lambda _: trinton.select_target(_, (1, 30)),
#     evans.RhythmHandler(
#         evans.tuplet([(1, 1, 1), (1, 1, 1, 1), (1, 1, 1, 1, 1), (1, 1, 1)])
#     ),
#     voice=score["percussion 1 voice"],
#     # preprocessor=trinton.fuse_preprocessor((5, 4, 3, 1))
# )

# globals

trinton.make_music(
    lambda _: trinton.select_target(_, (1,)),
    trinton.linear_attachment_command(
        attachments=[
            abjad.LilyPondLiteral(
                rf'\tweak text " 37\" " \startMeasureSpanner',
                site="absolute_before",
            ),
            abjad.LilyPondLiteral(r"\stopMeasureSpanner", site="absolute_after"),
        ],
        selector=trinton.select_leaves_by_index([0, -1]),
    ),
    voice=score["Global Context"],
)

# barlines

for voice_name in ["Global Context", "percussion 1 voice", "percussion 2 voice"]:
    trinton.make_music(
        lambda _: trinton.select_target(_, (1,)),
        trinton.attachment_command(
            attachments=[
                abjad.LilyPondLiteral(
                    [
                        r"""\once \override Staff.BarLine.glyph-name = "||" """,
                    ],
                    site="absolute_after",
                )
            ],
            selector=trinton.select_leaves_by_index([0]),
        ),
        voice=score[voice_name],
    )

# beautification

# breaking

trinton.make_music(
    lambda _: trinton.select_target(_, (1,)),
    trinton.attachment_command(
        attachments=[
            abjad.LilyPondLiteral(
                [
                    r"\break",
                    r"\once \override Staff.BarLine.extra-offset = #'(0 . 0)",
                    r"\once \override Staff.SpanBar.extra-offset = #'(0 . 0)",
                ],
                site="absolute_after",
            )
        ],
        selector=trinton.select_leaves_by_index([0]),
    ),
    voice=score["Global Context"],
)

# # spacing
#
# trinton.make_music(
#     lambda _: trinton.select_target(_, (1,)),
#     trinton.attachment_command(
#         attachments=[
#             abjad.LilyPondLiteral(
#                 r"\once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (1 30 33 26.5)))",
#                 site="absolute_before",
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0]),
#         tag=abjad.Tag("+SCORE"),
#     ),
#     voice=score["Global Context"],
# )
#
# trinton.make_music(
#     lambda _: trinton.select_target(_, (4,)),
#     trinton.attachment_command(
#         attachments=[
#             abjad.LilyPondLiteral(
#                 r"\once \override Score.NonMusicalPaperColumn.line-break-system-details = #'((alignment-distances . (8 38 28)))",
#                 site="absolute_before",
#             ),
#             abjad.bundle(
#                 abjad.Markup(r"\markup { S }"),
#                 r"- \tweak transparent ##t",
#                 r"- \tweak padding #23",
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0]),
#         tag=abjad.Tag("+SCORE"),
#         direction=abjad.UP,
#     ),
#     voice=score["Global Context"],
# )

# colophon

# trinton.make_music(
#     lambda _: trinton.select_target(_, (16,)),
#     trinton.attachment_command(
#         attachments=[
#             # abjad.LilyPondLiteral(
#             #     r"\override Staff.TextScript.whiteout = ##f",
#             #     site="before",
#             # ),
#             abjad.bundle(
#                 abjad.Markup(
#                     r"""\markup \fontsize #1 \lower #5 { \hspace #-1.75 \column \override #'(font-name . "Bodoni72 Book Italic") { \line { August - November 2025 } \line { Buffalo - Brooklyn, NY } } }"""
#                 ),
#                 r"- \tweak X-extent ##f",
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0]),
#         direction=abjad.DOWN,
#     ),
#     voice=score["cello 2 voice"],
# )

# trinton.make_music(
#     lambda _: trinton.select_target(_, (15,)),
#     trinton.attachment_command(
#         attachments=[
#             # abjad.LilyPondLiteral(
#             #     r"\override Staff.TextScript.whiteout = ##f",
#             #     site="before",
#             # ),
#             abjad.bundle(
#                 abjad.Markup(
#                     r"""\markup \fontsize #1 \lower #20 { \hspace #-66.6 \center-column \override #'(font-name . "Bodoni72 Book Italic") { \line { " \". . . The history is held and the context is closer to the burn of what you & I can call " } \line { " \"Knowing " } \line { " \"But we just mean feeling " } \line { " \"To know and be known and to strike against the brush " } \line { " \"The brush that submits to decay in the gutters " } \line { " \"and the gutters, what the American can understand as, the oversaturation, that which the American increasingly comes to know as, the flood." } \line { " \"We will have that flood and we will fear the fire" } \line { " \"I am unable to peel myself from any fire . . .\" " } } }"""
#                 ),
#                 r"- \tweak X-extent ##f",
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0]),
#         direction=abjad.DOWN,
#     ),
#     voice=score["cello lower voice"],
# )

# # extract parts
#
# trinton.extract_parts(score=score)

# render file

trinton.render_file(
    score=score,
    segment_path="/Users/trintonprater/scores/dur_e_dast/dur_e_dast/sections/ghost",
    build_path="/Users/trintonprater/scores/dur_e_dast/dur_e_dast/build",
    segment_name="_ghost",
    includes=[
        "/Users/trintonprater/scores/dur_e_dast/dur_e_dast/build/dur-e-dast-stylesheet.ily",
        "/Users/trintonprater/abjad/abjad/scm/abjad.ily",
    ],
)
