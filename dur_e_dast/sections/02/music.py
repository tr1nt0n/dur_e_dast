import abjad
from abjadext import rmakers
import baca
import evans
import trinton
import itertools
from dur_e_dast import library
from dur_e_dast import material_sequence
from dur_e_dast import pitch
from dur_e_dast import rhythm
from dur_e_dast import ts

# score

score = library.dur_e_dast_score([(1, 4) for _ in range(0, 68)])

ts.write_groupings(
    score=score, global_context="Global Context", groupings=ts.section_2_groupings
)

# structure

# library.illustrate_structure(
#     score=score,
#     voice_names=["percussion 1 voice", "percussion 2 voice"],
#     line_groups=material_sequence.line_groupings[1],
#     material_sequence=material_sequence.material_sequence[2:7],
# )
#
# library.illustrate_pitch_structure(
#     score=score,
#     voice_names=["percussion 1 voice", "percussion 2 voice"],
#     measure_groupings=trinton.rotated_sequence(
#         material_sequence.pitch_groupings, 3 % len(material_sequence.pitch_groupings)
#     ),
#     pitch_sequence=trinton.rotated_sequence(
#         material_sequence.pitch_sequence, 3 % len(material_sequence.pitch_sequence)
#     ),
#     measure_limit=67,
# )
#
# library.illustrate_pitch_structure(
#     score=score,
#     voice_names=["percussion 1 voice", "percussion 2 voice"],
#     measure_groupings=trinton.rotated_sequence(
#         material_sequence.implement_groupings,
#         3 % len(material_sequence.implement_groupings),
#     ),
#     pitch_sequence=trinton.rotated_sequence(
#         material_sequence.implement_sequence,
#         3 % len(material_sequence.implement_sequence),
#     ),
#     measure_limit=67,
#     material_markup="I",
# )

# music

# rhythm

rhythm.rhythm_b(
    score=score,
    voice_name="percussion 1 voice",
    measures=(1, 17),
    index=9,
    extra_voice="1",
    preprocessor=trinton.fuse_quarters_preprocessor((4, 9, 4)),
)

trinton.make_music(
    lambda _: trinton.select_target(_, (1, 17)),
    evans.PitchHandler(["a'"]),
    voice=score["percussion 1 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (1, 17)),
    evans.PitchHandler(["e"]),
    voice=score["percussion 1 voice polyrhythm 1"],
)

rhythm.rhythm_b(
    score=score,
    voice_name="percussion 2 voice",
    measures=(18, 33),
    index=30,
    extra_voice="1",
    preprocessor=trinton.fuse_quarters_preprocessor((4, 5, 3, 4)),
)

trinton.make_music(
    lambda _: trinton.select_target(_, (18, 33)),
    evans.PitchHandler(["a'"]),
    voice=score["percussion 2 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (18, 33)),
    evans.PitchHandler(["e"]),
    voice=score["percussion 2 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (18, 42)),
    evans.RhythmHandler(
        rhythm.rhythm_c(
            index=1, nesting_level=None, nesting_selector=None, duration_filter=True
        ),
    ),
    library.erase_ties(),
    voice=score["percussion 1 voice"],
    preprocessor=trinton.fuse_preprocessor((4, 5, 3, 4, 2, 7)),
)

rhythm.rhythm_b(
    score=score,
    voice_name="percussion 2 voice",
    measures=(43, 55),
    index=33,
    extra_voice="2",
    preprocessor=trinton.fuse_quarters_preprocessor((3, 4, 3, 3, 3)),
)

trinton.make_music(
    lambda _: trinton.select_target(_, (43, 55)),
    evans.PitchHandler(["a'"]),
    voice=score["percussion 2 voice temp 2"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (43, 55)),
    evans.PitchHandler(["e"]),
    voice=score["percussion 2 voice polyrhythm 2"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (43, 55)),
    evans.RhythmHandler(rhythm.rhythm_a(index=9, alpha=1, multiply=False)),
    library.erase_ties(),
    voice=score["percussion 1 voice"],
    preprocessor=trinton.fuse_preprocessor((3, 4, 3, 3, 3)),
)

trinton.make_music(
    lambda _: trinton.select_target(_, (56, 67)),
    evans.RhythmHandler(
        rhythm.rhythm_c(
            index=7,
            nesting_level=1,
            nesting_selector=trinton.select_logical_ties_by_index(
                [6, 7, 9], pitched=True, grace=False
            ),
            duration_filter=False,
        ),
    ),
    library.erase_ties(),
    trinton.attachment_command(
        attachments=[
            abjad.bundle(
                abjad.Articulation(">"), abjad.Tweak(r"- \tweak X-extent ##f")
            ),
        ],
        selector=trinton.select_logical_ties_by_index(
            [0, 1, 2, 3, -10, -6, -5, -1], first=True, pitched=True, grace=False
        ),
    ),
    voice=score["percussion 1 voice"],
    preprocessor=trinton.fuse_preprocessor((3, 6, 3)),
)

# pitch

trinton.make_music(
    lambda _: trinton.select_target(_, (1, 5)),
    pitch.pitch_b(index=28, selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index([0, 1, 4]),
    ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index([2, 3], first=True, grace=False),
        direction=abjad.DOWN,
    ),
    trinton.attachment_command(
        attachments=[abjad.Dynamic("mp")], selector=trinton.select_leaves_by_index([0])
    ),
    trinton.attachment_command(
        attachments=[
            trinton.boxed_markup(
                string=r"Styrofoam Blocks",
                tweaks=[
                    abjad.Tweak(r"- \tweak layer 100"),
                    # abjad.Tweak(r"- \tweak padding 3")
                ],
                column="\center-column",
                font_name="Bodoni72 Book",
                fontsize=2,
                string_only=False,
            ),
        ],
        selector=trinton.select_leaves_by_index([0], grace=False),
        direction=abjad.UP,
    ),
    voice=score["percussion 1 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (1, 5)),
    pitch.pitch_b(index=33, selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index([2]),
    ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index([0, 1], first=True, grace=False),
    ),
    voice=score["percussion 1 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (7,)),
    pitch.pitch_c(
        index=6,
        voice_index=0,
        selector=trinton.select_logical_ties_by_index([1], pitched=True, grace=False),
    ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index(
            [1], pitched=True, first=True, grace=False
        ),
        direction=abjad.DOWN,
    ),
    trinton.linear_attachment_command(
        attachments=[
            abjad.Dynamic("f"),
            abjad.StartHairpin(">o"),
            abjad.StopHairpin(),
            abjad.Dynamic("p"),
        ],
        selector=trinton.select_logical_ties_by_index(
            [0, 0, 1, 2], first=True, pitched=True
        ),
    ),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(pitched=True, grace=False, first=True),
    #     direction=abjad.UP
    # ),
    voice=score["percussion 1 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (7,)),
    pitch.pitch_c(
        index=6,
        voice_index=1,
        selector=trinton.select_logical_ties_by_index([1], pitched=True, grace=False),
    ),
    # trinton.attachment_command(
    #     attachments=[
    #         abjad.Articulation("stopped")
    #     ],
    #     selector=trinton.select_logical_ties_by_index([1], pitched=True, first=True, grace=False),
    #     direction=abjad.UP
    # ),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index(
            [1], pitched=True, first=True, grace=False
        )
    ),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(pitched=True, first=True),
    #     direction=abjad.UP
    # ),
    voice=score["percussion 1 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (9, 12)),
    pitch.pitch_b(
        index=6,
        selector=trinton.select_logical_ties_by_index(
            [2, 3], pitched=True, grace=False
        ),
    ),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index([3], pitched=True, grace=False),
    ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index(
            [2], pitched=True, first=True, grace=False
        ),
        direction=abjad.DOWN,
    ),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(
    #         first=True,
    #         pitched=True,
    #         grace=False
    #     ),
    #     direction=abjad.DOWN
    # ),
    voice=score["percussion 1 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (9, 12)),
    pitch.pitch_b(
        index=6,
        selector=trinton.select_logical_ties_by_index([3], pitched=True, grace=False),
    ),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index([2], pitched=True, grace=False),
    ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index(
            [3], pitched=True, first=True, grace=False
        ),
        direction=abjad.DOWN,
    ),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(
    #         first=True,
    #         pitched=True,
    #         grace=False
    #     ),
    #     direction=abjad.UP
    # ),
    voice=score["percussion 1 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (14, 17)),
    pitch.pitch_a(index=36, selector=trinton.logical_ties(pitched=True, grace=False)),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(
    #         first=True,
    #         pitched=True,
    #         grace=False
    #     ),
    #     direction=abjad.DOWN
    # ),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index([4], pitched=True, grace=False)
    ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index(
            [0, 1, 2, 3], pitched=True, first=True, grace=False
        ),
        direction=abjad.DOWN,
    ),
    voice=score["percussion 1 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (14, 17)),
    pitch.pitch_a(index=41, selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.duration_line(
        selector=trinton.select_logical_ties_by_index([0, 1], pitched=True, grace=False)
    ),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(
    #         first=True,
    #         pitched=True,
    #         grace=False
    #     ),
    #     direction=abjad.UP
    # ),
    trinton.attachment_command(
        attachments=[abjad.Articulation("stopped")],
        selector=trinton.select_logical_ties_by_index(
            [2, 3], pitched=True, first=True, grace=False
        ),
        direction=abjad.DOWN,
    ),
    trinton.linear_attachment_command(
        attachments=[abjad.StartHairpin(">"), abjad.Dynamic("pp")],
        selector=trinton.select_logical_ties_by_index(
            [0, 2], first=True, pitched=True, grace=False
        ),
    ),
    voice=score["percussion 1 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (18, 26)),
    pitch.pitch_a(index=42, selector=trinton.logical_ties(pitched=True, grace=False)),
    library.attach_pitch_a_tenuti(index=42),
    trinton.attachment_command(
        attachments=[
            trinton.boxed_markup(
                string=r"Scrubbing Brush",
                tweaks=[
                    abjad.Tweak(r"- \tweak layer 100"),
                    # abjad.Tweak(r"- \tweak padding 3"),
                ],
                column="\center-column",
                font_name="Bodoni72 Book",
                fontsize=2,
                string_only=False,
            ),
        ],
        selector=trinton.select_leaves_by_index([0], grace=False),
        direction=abjad.UP,
    ),
    trinton.duration_line(selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.linear_attachment_command(
        attachments=[abjad.Dynamic("mp"), abjad.Dynamic("p")],
        selector=trinton.select_logical_ties_by_index(
            [0, 1], pitched=True, first=True, grace=False
        ),
    ),
    voice=score["percussion 1 voice"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (27, 42)),
    pitch.pitch_b(index=54, selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.duration_line(selector=trinton.logical_ties(pitched=True, grace=False)),
    # trinton.annotate_leaves_locally(
    #     selector=trinton.logical_ties(first=True, pitched=True, grace=False)
    # ),
    trinton.attachment_command(
        attachments=[
            trinton.boxed_markup(
                string=r"Styrofoam Blocks",
                tweaks=[
                    abjad.Tweak(r"- \tweak layer 100"),
                    # abjad.Tweak(r"- \tweak padding 3")
                ],
                column="\center-column",
                font_name="Bodoni72 Book",
                fontsize=2,
                string_only=False,
            ),
        ],
        selector=trinton.select_logical_ties_by_index(
            [15], first=True, pitched=True, grace=False
        ),
        direction=abjad.UP,
    ),
    trinton.linear_attachment_command(
        attachments=[abjad.Dynamic("mp"), abjad.Dynamic('"f"')],
        selector=trinton.select_logical_ties_by_index(
            [0, 15], first=True, pitched=True, grace=False
        ),
    ),
    voice=score["percussion 1 voice"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (16,)),
    trinton.attachment_command(
        attachments=[
            trinton.boxed_markup(
                string=r"Drum Brushes (2 in one hand)",
                tweaks=[
                    abjad.Tweak(r"- \tweak layer 100"),
                    # abjad.Tweak(r"- \tweak padding 3"),
                ],
                column="\center-column",
                font_name="Bodoni72 Book",
                fontsize=2,
                string_only=False,
            ),
        ],
        selector=trinton.select_leaves_by_index([0], grace=False),
        direction=abjad.UP,
    ),
    voice=score["percussion 2 voice"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (18, 26)),
    pitch.pitch_c(
        index=15,
        voice_index=0,
        selector=trinton.logical_ties(pitched=True, grace=False),
    ),
    voice=score["percussion 2 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (18, 26)),
    pitch.pitch_c(
        index=15,
        voice_index=1,
        selector=trinton.logical_ties(pitched=True, grace=False),
    ),
    voice=score["percussion 2 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (27, 29)),
    pitch.pitch_b(index=40, selector=trinton.logical_ties(pitched=True, grace=False)),
    voice=score["percussion 2 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (27, 29)),
    pitch.pitch_b(index=37, selector=trinton.logical_ties(pitched=True, grace=False)),
    voice=score["percussion 2 voice polyrhythm 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (30, 33)),
    pitch.pitch_a(index=0, selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.duration_line(selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.attachment_command(
        attachments=[abjad.Articulation("tenuto")],
        selector=trinton.select_leaves_by_index([0], pitched=True, grace=False),
        direction=abjad.UP,
    ),
    voice=score["percussion 2 voice temp 1"],
)

trinton.make_music(
    lambda _: trinton.select_target(_, (30, 33)),
    pitch.pitch_a(index=5, selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.duration_line(selector=trinton.logical_ties(pitched=True, grace=False)),
    trinton.attachment_command(
        attachments=[abjad.Articulation("tenuto")],
        selector=trinton.select_leaves_by_index([0], pitched=True, grace=False),
        direction=abjad.DOWN,
    ),
    voice=score["percussion 2 voice polyrhythm 1"],
)

# globals

# fermate

trinton.fermata_measures(
    score=score,
    measures=[68],
    fermata="middle-fermata",
    voice_names=["percussion 1 voice", "percussion 2 voice"],
    font_size=14,
    clef_whitespace=True,
    blank=True,
    last_measure=False,
    padding=-6,
    # extra_offset=2.5,
    tag=abjad.Tag("+SCORE"),
)

trinton.make_music(
    lambda _: trinton.select_target(_, (68,)),
    trinton.attachment_command(
        attachments=[
            abjad.LilyPondLiteral(
                [
                    r"\once \override Score.BarLine.extra-offset = #'(0 . 0)",
                    r"\once \override Score.SpanBar.extra-offset = #'(0 . 0)",
                ],
                site="before",
            ),
        ],
        selector=trinton.select_leaves_by_index([0]),
    ),
    voice=score["Global Context"],
)

# tempi

# trinton.make_music(
#     lambda _: trinton.select_target(_, (3, 4)),
#     trinton.spanner_command(
#         strings=[
#             trinton.tempo_markup(
#                 note_value=8,
#                 tempo=112,
#                 padding=0,
#                 note_head_fontsize=0.5,
#                 stem_length=2,
#                 text_fontsize=8,
#                 dotted=False,
#                 fraction=None,
#                 tempo_change="accel.",
#                 site="after",
#                 hspace=0,
#                 string_only=True,
#             ),
#             trinton.tempo_markup(
#                 note_value=8,
#                 tempo=112,
#                 padding=0,
#                 note_head_fontsize=0.5,
#                 stem_length=2,
#                 text_fontsize=8,
#                 dotted=False,
#                 fraction=None,
#                 tempo_change=None,
#                 site="after",
#                 hspace=0,
#                 string_only=True,
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0, -1]),
#         style="solid-line-with-arrow",
#         padding=13,
#         tweaks=None,
#         right_padding=2,
#         direction=None,
#         full_string=True,
#         command="Three",
#     ),
#     voice=score["Global Context"],
# )

# trinton.make_music(
#     lambda _: trinton.select_target(_, (2, 3)),
#     trinton.linear_attachment_command(
#         attachments=[
#             abjad.LilyPondLiteral(
#                 r"\set Score.proportionalNotationDuration = #(ly:make-moment 1/30)",
#                 site="before",
#             ),
#             abjad.LilyPondLiteral(
#                 r"\set Score.proportionalNotationDuration = #(ly:make-moment 1/20)",
#                 site="before",
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0, 1,]),
#         tag=abjad.Tag("+SCORE"),
#     ),
#     voice=score["Global Context"],
# )

# trinton.make_music(
#     lambda _: trinton.select_target(_, (8,)),
#     trinton.attachment_command(
#         attachments=[abjad.LilyPondLiteral([r"\magnifyStaff #7/8"], site="before")],
#         selector=trinton.select_leaves_by_index([0]),
#     ),
#     voice=score["cello 2 voice temp"],
# )

# trinton.make_music(
#     lambda _: trinton.select_target(_, (10,)),
#     trinton.attachment_command(
#         attachments=[
#             abjad.LilyPondLiteral([r"\magnifyStaff #1"], site="absolute_after")
#         ],
#         selector=trinton.select_leaves_by_index([-1], grace=False),
#     ),
#     voice=score["cello lower voice"],
# )
#
# for voice_name in ["violin 1 bow voice", "violin 4 voice", "viola 2 voice temp 2"]:
#     trinton.make_music(
#         lambda _: trinton.select_target(_, (8, 10)),
#         trinton.attachment_command(
#             attachments=[abjad.LilyPondLiteral([r"\magnifyStaff #7/8"], site="before")],
#             selector=trinton.select_leaves_by_index([0]),
#         ),
#         trinton.attachment_command(
#             attachments=[
#                 abjad.LilyPondLiteral([r"\magnifyStaff #1"], site="absolute_after")
#             ],
#             selector=trinton.select_leaves_by_index([-1]),
#         ),
#         voice=score[voice_name],
#     )

# time signature changes

# trinton.change_time_signatures(
#     score=score,
#     global_context="Global Context",
#     measure_range=(5,),
#     replacement_signatures=[(3, 8), (3, 8)],
# )

# after signature change tempo

# trinton.make_music(
#     lambda _: trinton.select_target(_, (6,)),
#     trinton.attachment_command(
#         attachments=[
#             trinton.tempo_markup(
#                 note_value=8,
#                 tempo=48,
#                 padding=9,
#                 note_head_fontsize=0.5,
#                 stem_length=2,
#                 text_fontsize=8,
#                 dotted=False,
#                 fraction=None,
#                 tempo_change=None,
#                 site="after",
#                 hspace=-3.5,
#                 string_only=False,
#             ),
#         ],
#         selector=trinton.select_leaves_by_index([0]),
#         direction=abjad.UP,
#         # tag=abjad.Tag("+SCORE"),
#     ),
#     voice=score["Global Context"],
# )

# barlines

for voice_name in ["Global Context", "percussion 1 voice", "percussion 2 voice"]:
    trinton.make_music(
        lambda _: trinton.select_target(_, (68,)),
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

library.break_systems(score=score, global_context="Global Context", i_offset=30)

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
    segment_path="/Users/trintonprater/scores/dur_e_dast/dur_e_dast/sections/02",
    build_path="/Users/trintonprater/scores/dur_e_dast/dur_e_dast/build",
    segment_name="02",
    includes=[
        "/Users/trintonprater/scores/dur_e_dast/dur_e_dast/build/section-stylesheet.ily",
        "/Users/trintonprater/abjad/abjad/scm/abjad.ily",
    ],
)
