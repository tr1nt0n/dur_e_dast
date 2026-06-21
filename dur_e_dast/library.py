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


def break_systems(score, global_context):
    measures = abjad.select.leaves(score[global_context])
    for i, measure in zip(list(range(1, len(measures) + 1)), measures):
        if i % 10 == 0 and i != 0:
            abjad.attach(
                abjad.LilyPondLiteral(r"\break", site="absolute_after"), measure
            )
        else:
            abjad.attach(
                abjad.LilyPondLiteral(r"\noBreak", site="absolute_after"), measure
            )
