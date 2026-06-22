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
