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


def rhythm_a(index):
    def return_rhythms(durations):
        integer_sequence = trinton.rotated_sequence(
            ts.all_groupings, index % len(ts.all_groupings)
        )
        integer_sequence = abjad.sequence.flatten(integer_sequence)
        trimmed_integer_sequence = trinton.remove_adjacent(integer_sequence)

        retrograde_integer_sequence = integer_sequence[::-1]

        chords = abjad.select.partition_by_counts(
            trimmed_integer_sequence,
            retrograde_integer_sequence,
            cyclic=True,
            overhang=True,
        )

        tuplet_ratios = []

        for chord in chords:
            pulse_amount = chord.sort()
            pulse_amount = chord[-1]

            note_indices = [_ - 1 for _ in chord]
            tuplet = [-1 for _ in range(0, pulse_amount)]

            for note_index in note_indices:
                tuplet[note_index] = 1

            final_tuplet = []

            rest_counter = 0
            attack_counter = 0
            for i, _ in enumerate(tuplet):
                if attack_counter == 0:
                    if _ == -1:
                        rest_counter -= 1
                    else:
                        attack_counter += 1
                        final_tuplet.append(rest_counter)
                        rest_counter = 0
                else:
                    if _ == -1:
                        rest_counter -= 1
                    else:
                        attack_counter += 1
                        note_addition = rest_counter * -1
                        tuplet_ratio = note_addition + _
                        final_tuplet.append(tuplet_ratio)
                        rest_counter = 0

                last_index = len(tuplet) - 1
                if i == last_index and _ == 1:
                    final_tuplet.append(1)

            final_tuplet = [_ for _ in final_tuplet if _ != 0]

            tuplet = tuple(final_tuplet)
            tuplet_ratios.append(tuplet)

        container = abjad.Container()
        rhythm_selections = rmakers.tuplet(durations, tuplet_ratios)
        container.extend(rhythm_selections)

        rhythm_selections = abjad.mutate.eject_contents(container)
        return rhythm_selections

    return return_rhythms
