import 'package:music_theory/src/chord/chord_registry.dart';
import 'package:music_theory/src/enums/chord_type.dart';
import 'package:music_theory/src/functions/semitone_formula_to_chord_type.dart';

import '../note/note.dart';

/// Dart implementation of a chord.
/// A [Chord] consists of 3 [GuitarNote]'s (1st, 3rd, 5th) or 4 [GuitarNote]'s
/// (1st, 3rd, 5th, 7th) with key [GuitarNote] as first.
class Chord {
  /// Key note of chord.
  GuitarNote key;

  /// Notes of chord.
  List<GuitarNote> notes;

  /// Type of chord.
  ChordType type;

  Chord(this.key, this.notes, this.type);

  ///
  /// General constructors
  ///

  /// Chords constructor from key note and mode.
  factory Chord.getChordFromMode(GuitarNote key, ChordType mode) {
    /// Get the constructor from the registry.
    final constructor = chordRegistry[mode];

    /// Make the chord.
    final chord = constructor!(key);
    return chord;
  }

  /// Chord from semitones formula
  factory Chord.getChordFromSemitonesFormula({
    required GuitarNote key,
    required List<int> semitoneList,
    ChordType? chordType,
  }) =>
      Chord(
          key,

          /// Build the notes list from the semitones list.
          semitoneList.map((semitones) => key + semitones).toList(),

          /// Compute the chord type from the semitones list.
          chordType ?? semitoneFormulaToChordType(semitoneList));

  ///
  /// Major chords constructor from key note.
  ///

  /// Major chord constructor from key note.
  factory Chord.getMajor(GuitarNote key) =>
      Chord(key, [key, key + 4, key + 7], ChordType.major);

  /// Major 7 chord constructor from key note.
  factory Chord.getMajor7(GuitarNote key) =>
      Chord(key, [key, key + 4, key + 7, key + 11], ChordType.major7);

  ///
  /// Minor chords constructors from key note.
  ///

  /// Minor chord constructor from key note.
  factory Chord.getMinor(GuitarNote key) =>
      Chord(key, [key, key + 3, key + 7], ChordType.minor);

  /// Minor 7 chord constructor from key note.
  factory Chord.getMinor7(GuitarNote key) =>
      Chord(key, [key, key + 3, key + 7, key + 11], ChordType.minor7);

  ///
  /// Useful functions
  ///

  int hasNote(GuitarNote queryNote) {
    for (int index = 0; index < 3; index++) {
      GuitarNote note = notes[index];
      if (note.isEqualTo(queryNote)) {
        return index * 2 + 1;
      }
    }
    return 0;
  }
}
