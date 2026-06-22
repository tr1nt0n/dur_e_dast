import abjad
from abjadext import rmakers
import baca
import evans
import trinton
import itertools
import math
import random
from sympy import combinatorics
from dur_e_dast import library

section_1_groupings = [2, 3, 3, 2, 11, 5, 3]
section_2_groupings = [4, 9, 4, 4, 5, 3, 4, 2, 7, 3, 4, 3, 3, 3, 6, 3]
section_3_groupings = [1, 1, 2, 1, 4, 4, 2, 3, 7, 3, 3]
section_4_groupings = [3, 4, 4, 3]

all_groupings = [
    section_1_groupings,
    section_2_groupings,
    section_3_groupings,
    section_4_groupings,
]


def write_groupings(score, global_context, groupings):
    measure_counter = 1

    for grouping in groupings:
        first_measure = measure_counter
        last_measure = measure_counter + grouping
        last_measure = last_measure - 1

        trinton.make_music(
            lambda _: trinton.select_target(_, (first_measure, last_measure)),
            trinton.linear_attachment_command(
                attachments=[
                    abjad.LilyPondLiteral(
                        rf'\tweak text " {grouping} " \startMeasureSpanner',
                        site="absolute_before",
                    ),
                    abjad.LilyPondLiteral(
                        r"\stopMeasureSpanner", site="absolute_after"
                    ),
                ],
                selector=trinton.select_leaves_by_index([0, -1]),
            ),
            voice=score[global_context],
        )

        measure_counter += grouping
