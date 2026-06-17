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
