import 'note.dart';

/// Dart implementation of a chord.
/// A [Chord] consists of 3 [Note]'s (1st, 3rd, 5th) or 4 [Note]'s
/// (1st, 3rd, 5th, 7th) with key [Note] as first.
class Chord {
  /// Key note of chord.
  Note key;

  /// Notes of chord.
  List<Note> notes;

  /// Type of chord.
  ChordType type;

  Chord(this.key, this.notes, this.type);

  /// Chords constructor from key note and mode.
  factory Chord.getChordFromMode(Note key, ChordType mode) {
    /// Get the constructor from the registry.
    final constructor = chordRegistry[mode];

    /// Make the chord.
    final chord = constructor!(key);
    return chord;
  }

  /// Major chords constructor from key note.
  factory Chord.getMajor(Note key) =>
      Chord(key, [key, key + 4, key + 7], ChordType.major);

  /// Major chords constructor from key note.
  factory Chord.getMajor7(Note key) =>
      Chord(key, [key, key + 4, key + 7, key + 11], ChordType.major7);

  /// Minor chords constructor from key note.
  factory Chord.getMinor(Note key) =>
      Chord(key, [key, key + 3, key + 7], ChordType.minor);

  factory Chord.getChordFromSemitonesFormula({
    required Note key,
    required List<int> semitoneList,
    required ChordType? chordType,
  }) =>
      Chord(
          key,

          /// Build the notes list from the semitones list.
          semitoneList.map((semitones) => key + semitones).toList(),

          /// Compute the chord type from the semitones list.
          chordType ?? semitoneListToChordType(semitoneList));

  int hasNote(Note queryNote) {
    for (int index = 0; index < 3; index++) {
      Note note = notes[index];
      if (note.isEqualTo(queryNote)) {
        return index * 2 + 1;
      }
    }
    return 0;
  }
}

/// TODO: Implement semitoneListToChordType
ChordType semitoneListToChordType(List<int> semitonesList) => ChordType.major;

enum ChordType {
  major,
  minor,
  augmented,
  diminished,
  major7,
  minor7,
  dominant7,
  augmented7,
  dominant7b5,
  minorMaj7,
  halfDiminished,
  diminished7,
}

const chordTypeToSemitonesFormula = <ChordType, List<int>>{
  ChordType.major: [0, 4, 7], // 1, 3, 5
  ChordType.minor: [0, 3, 7], // 1, B3, 5
  ChordType.augmented: [0, 4, 8], // 1, 3, #5
  ChordType.diminished: [0, 3, 6], // 1, B3, B5
  ChordType.major7: [0, 4, 7, 11], // 1, 3, 5, 7
  ChordType.minor7: [0, 3, 7, 10], // 1, B3, 5, B7
  ChordType.dominant7: [0, 4, 7, 10], // 1, 3, 5, B7
  ChordType.augmented7: [0, 4, 8, 10], // 1, 3, #5, B7
  ChordType.dominant7b5: [0, 4, 6, 10], // 1, 3, B5, B7
  ChordType.minorMaj7: [0, 3, 7, 11], // 1, B3, 5, 7
  ChordType.halfDiminished: [0, 3, 6, 10], // 1, B3, B5, B7
  ChordType.diminished7: [0, 3, 6, 9], // 1, B3, B5, BB7
};

/// You can get the constructor by var _constructor = chordRegistry['major'].
/// And then, make your major chord by var _chord = _constructor(Note('C')).
Map<ChordType, Chord Function(Note)> chordRegistry = {
  for (ChordType chordType in ChordType.values)
    chordType: (note) => Chord.getChordFromSemitonesFormula(
        key: note,
        semitoneList: chordTypeToSemitonesFormula[chordType]!,
        chordType: chordType),
  /* example
  ChordType.major: (note) => Chord.getChordFromSemitonesFormula(
        key: note,
        semitoneList: chordTypeToSemitonesFormula[ChordType.major]!,
        chordType: chordType,
      ),
  */
};
