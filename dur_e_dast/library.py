import abjad
import baca
import evans
import trinton
import itertools
import numpy
import dur_e_dast
import random
import statistics
from sympy import combinatorics

# score


def dur_e_dast_score(time_signatures):
    score = trinton.make_empty_score(
        instruments=[abjad.Percussion(), abjad.Percussion()],
        groups=[2],
        staff_types=[
            ["Staff", "disappearingStaff"],
        ],
        time_signatures=time_signatures,
        filler=abjad.Skip,
    )

    return score


# beautification


def break_systems(score, global_context, i_offset=0):
    measures = abjad.select.leaves(score[global_context])
    for i, measure in zip(list(range(1, len(measures) + 1)), measures):
        i = i + i_offset
        if i % 10 == 0 and i != 0:
            abjad.attach(
                abjad.LilyPondLiteral(r"\break", site="absolute_after"), measure
            )
        else:
            abjad.attach(
                abjad.LilyPondLiteral(r"\noBreak", site="absolute_after"), measure
            )


def erase_ties(selector=trinton.logical_ties(pitched=True, grace=False)):
    def erase(argument):
        selections = selector(argument)
        selections = abjad.select.logical_ties(selections, pitched=True, grace=False)

        for selection in selections:
            leaves = abjad.select.leaves(selection)

            if len(leaves) > 1:
                for leaf in leaves[1:]:
                    abjad.attach(
                        abjad.LilyPondLiteral(
                            r"\once \override NoteHead.transparent = ##t", site="before"
                        ),
                        leaf,
                    )

    return erase


# structure


def illustrate_structure(score, voice_names, line_groups, material_sequence):
    primary_voice_name = voice_names[0]
    secondary_voice_name = voice_names[-1]

    measure_counter = 1

    _material_index_to_color = {
        0: "\一",
        1: "\二",
        2: "\三",
    }

    for line_group, material in zip(line_groups, material_sequence):
        first_measure = measure_counter
        last_measure = measure_counter + line_group
        last_measure = last_measure - 1

        primary_voice_material = material[0]

        primary_voice_color = _material_index_to_color[primary_voice_material]

        trinton.make_music(
            lambda _: trinton.select_target(_, (first_measure, last_measure)),
            trinton.linear_attachment_command(
                attachments=[
                    abjad.LilyPondLiteral(
                        rf"""\staffHighlight {primary_voice_color} """,
                        site="before",
                    ),
                    abjad.LilyPondLiteral(
                        r"\stopStaffHighlight", site="absolute_after"
                    ),
                ],
                selector=trinton.select_leaves_by_index([0, -1]),
            ),
            voice=score[primary_voice_name],
        )

        if len(material) > 1:
            secondary_voice_material = material[-1]

            secondary_voice_color = _material_index_to_color[secondary_voice_material]

            trinton.make_music(
                lambda _: trinton.select_target(_, (first_measure, last_measure)),
                evans.RhythmHandler(evans.talea([100], 4)),
                trinton.transparent_noteheads(selector=trinton.pleaves()),
                trinton.linear_attachment_command(
                    attachments=[
                        abjad.LilyPondLiteral(
                            rf"""\staffHighlight {secondary_voice_color} """,
                            site="before",
                        ),
                        abjad.LilyPondLiteral(
                            r"\stopStaffHighlight", site="absolute_after"
                        ),
                    ],
                    selector=trinton.select_leaves_by_index([0, -1]),
                ),
                voice=score[secondary_voice_name],
            )

        measure_counter += line_group


def illustrate_pitch_structure(
    score,
    voice_names,
    measure_groupings,
    pitch_sequence,
    measure_limit,
    material_markup="P",
):
    primary_voice_name = voice_names[0]
    secondary_voice_name = voice_names[-1]

    _material_index_to_color = {
        0: "\一",
        1: "\二",
        2: "\三",
    }

    measure_counter = 1
    for measure_grouping, pitch_material in zip(measure_groupings, pitch_sequence):
        first_measure = measure_counter
        last_measure = measure_counter + measure_grouping
        last_measure = last_measure - 1

        if last_measure > measure_limit:
            break

        else:
            trinton.make_music(
                lambda _: trinton.select_target(_, (first_measure, last_measure)),
                trinton.linear_attachment_command(
                    attachments=[
                        trinton.boxed_markup(
                            string=f"{material_markup}{pitch_material + 1}",
                            tweaks=[
                                abjad.Tweak(
                                    rf"- \tweak color {_material_index_to_color[pitch_material]}"
                                ),
                                abjad.Tweak(r"- \tweak layer 100"),
                            ],
                            column="\center-column",
                            font_name="Bodoni72 Book",
                            fontsize=4,
                            string_only=False,
                        ),
                    ],
                    selector=trinton.select_leaves_by_index([0]),
                    direction=abjad.UP,
                ),
                voice=score[primary_voice_name],
            )

            secondary_pitch_material = pitch_material - 1
            secondary_pitch_material = secondary_pitch_material % 3

            trinton.make_music(
                lambda _: trinton.select_target(_, (first_measure, last_measure)),
                trinton.linear_attachment_command(
                    attachments=[
                        trinton.boxed_markup(
                            string=f"{material_markup}{secondary_pitch_material + 1}",
                            tweaks=[
                                abjad.Tweak(
                                    rf"- \tweak color {_material_index_to_color[secondary_pitch_material]}"
                                ),
                                abjad.Tweak(r"- \tweak layer 100"),
                            ],
                            column="\center-column",
                            font_name="Bodoni72 Book",
                            fontsize=4,
                            string_only=False,
                        ),
                    ],
                    selector=trinton.select_leaves_by_index([0]),
                    direction=abjad.UP,
                ),
                voice=score[secondary_voice_name],
            )

            measure_counter += measure_grouping
