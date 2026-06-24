import abjad
from abjadext import rmakers
import baca
import evans
import trinton
import itertools
from sympy import combinatorics
from dur_e_dast import library
from dur_e_dast import rhythm
from dur_e_dast import ts

# rhythm sequencing

flattened_groupings = abjad.sequence.flatten(ts.all_groupings)
material_sequence = [_ % 3 for _ in flattened_groupings]
material_sequence = trinton.remove_adjacent(material_sequence)
material_sequence = material_sequence[0:15]
material_sequence = abjad.select.partition_by_counts(
    material_sequence,
    [1, 2],
    cyclic=True,
    overhang=True,
)

line_groupings = [[23, 6], [17, 16, 9, 13, 12], [9, 22], [14]]

# pitch sequencing

pitch_groupings = flattened_groupings[::-1]
pitch_groupings = [_ % 3 for _ in pitch_groupings]
pitch_groupings = [_ + 1 for _ in pitch_groupings]
pitch_groupings = abjad.select.partition_by_counts(
    abjad.sequence.flatten(ts.all_groupings),
    pitch_groupings,
    cyclic=True,
    overhang=True,
)
pitch_groupings = [sum(_) for _ in pitch_groupings]

pitch_sequence = abjad.sequence.flatten(material_sequence)
pitch_sequence = pitch_sequence[::-1]

# implement sequencing

implement_groupings = trinton.invert([flattened_groupings], transposition=0)
implement_groupings = abjad.sequence.flatten(implement_groupings)
implement_groupings = [_ % 3 for _ in implement_groupings]
implement_groupings = [_ + 3 for _ in implement_groupings]
implement_groupings = abjad.select.partition_by_counts(
    abjad.sequence.flatten(ts.all_groupings),
    implement_groupings,
    cyclic=True,
    overhang=True,
)
implement_groupings = [sum(_) for _ in implement_groupings]

implement_sequence = trinton.invert(material_sequence, transposition=0)
implement_sequence = abjad.sequence.flatten(implement_sequence)
implement_sequence = [_ % 3 for _ in implement_sequence]
