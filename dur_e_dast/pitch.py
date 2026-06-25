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

_index_to_pitch_name = {
    0: "a'",
    1: "f'",
    2: "d'",
    3: "b",
    4: "g",
    5: "e",
}


def pitch_a(index, selector=trinton.logical_ties(pitched=True, grace=False)):
    def do_pitching(argument):
        selections = selector(argument)
        integer_sequence = abjad.sequence.flatten(ts.all_groupings)
        integer_sequence = trinton.rotated_sequence(
            integer_sequence, index % len(integer_sequence)
        )

        partitioned_selections = abjad.select.partition_by_counts(
            selections,
            integer_sequence,
            cyclic=True,
            overhang=True,
        )

        for transposition_group, transposition in zip(
            partitioned_selections, itertools.cycle(integer_sequence)
        ):

            transposition = transposition % 6

            pitch = _index_to_pitch_name[transposition]

            pitch_list = [pitch for _ in range(0, len(transposition_group))]

            if transposition != 0:
                pitch_list[0] = _index_to_pitch_name[transposition - 1]

            else:
                for _ in range(1, len(transposition_group)):
                    pitch_list[_] = _index_to_pitch_name[transposition + 1]

            pitch_handler = evans.PitchHandler(pitch_list)

            pitch_handler(transposition_group)

    return do_pitching


def pitch_b(index, selector=trinton.logical_ties(pitched=True, grace=False)):
    def do_pitching(argument):
        selections = selector(argument)

        integer_sequence = ts.all_groupings
        inverted_integer_sequence = trinton.invert(integer_sequence, transposition=3)
        multiplied_integer_sequence = []

        for sequence in integer_sequence:
            new_chord = []
            for _ in sequence:
                _ = _ * 5
                _ = _ % 12
                new_chord.append(_)

            multiplied_integer_sequence.append(new_chord)

        final_pitch_list = []

        for prime, inversion, multiplication in zip(
            integer_sequence, inverted_integer_sequence, multiplied_integer_sequence
        ):
            final_pitch_list.append(prime)
            final_pitch_list.append(inversion)
            final_pitch_list.append(multiplication)

        final_pitch_list = abjad.sequence.flatten(final_pitch_list)

        final_pitch_list = [_ % 6 for _ in final_pitch_list]

        final_pitch_list = [_index_to_pitch_name[_] for _ in final_pitch_list]

        final_pitch_list = trinton.rotated_sequence(
            final_pitch_list, index % len(final_pitch_list)
        )

        pitch_handler = evans.PitchHandler(final_pitch_list)
        pitch_handler(selections)

    return do_pitching


def pitch_c(
    index, voice_index=None, selector=trinton.logical_ties(pitched=True, grace=False)
):
    def do_pitching(argument):
        components = abjad.select.components(argument)
        selections = selector(argument)

        interval_sequence = abjad.sequence.flatten(ts.all_groupings)
        interval_sequence = trinton.rotated_sequence(
            interval_sequence, index % len(interval_sequence)
        )

        chords = []

        for i, interval in enumerate(interval_sequence):
            if i == 0:
                first_pitch = 0
            else:
                previous_chord = chords[i - 1]
                first_pitch = previous_chord[-1]

            second_pitch = first_pitch + interval
            second_pitch = second_pitch % 6
            chord = [first_pitch, second_pitch]
            chords.append(chord)

        chords = trinton.rotated_sequence(chords, index % len(chords))

        if voice_index is not None:
            initial_pitch_list = []
            for chord in chords:
                relevant_pitch = chord[voice_index]
                initial_pitch_list.append(relevant_pitch)

            final_pitch_list = []

            for pitch, tuplet in zip(
                itertools.cycle(initial_pitch_list), abjad.select.tuplets(components)
            ):
                limit = len(abjad.select.logical_ties(tuplet))
                for _ in range(0, limit):
                    final_pitch_list.append(_index_to_pitch_name[pitch])

            pitch_list = final_pitch_list

        else:
            pitch_list = chords

        pitch_handler = evans.PitchHandler(pitch_list=pitch_list)

        pitch_handler(selections)

    return do_pitching
