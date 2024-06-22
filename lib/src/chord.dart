import 'package:music_theory/src/mode.dart';

import 'note.dart';

/// Dart implementation of a chord.
/// A [Chord] consists of 3 [Note]'s (1st, 3rd, 5th) or 4 [Note]'s
/// (1st, 3rd, 5th, 7th) with key [Note] as first.
class Chord {
  /// Key note of chord.
  Note key;

  /// Notes of chord.
  List<Note> notes;

  Chord(this.key, this.notes);

  /// Major chords constructor from key note.
  factory Chord.getMajor(Note key) {
    List<Note> notes = [key];
    notes.add(key + 4);
    notes.add(key + 7);
    return Chord(key, notes);
  }

  /// Major chords constructor from key note.
  factory Chord.getMajor7(Note key) {
    List<Note> notes = [key];
    notes.add(key + 4);
    notes.add(key + 7);
    notes.add(key + 11);
    return Chord(key, notes);
  }

  /// Minor chords constructor from key note.
  factory Chord.getMinor(Note key) {
    List<Note> notes = [key];
    notes.add(key + 3);
    notes.add(key + 7);
    return Chord(key, notes);
  }

  factory Chord.getChordFromMode(Note key, ChordType mode, {int nNotes = 3}) {
    print(mode.name);
    final constructor = chordRegistry[mode];
    print(key.name);
    final chord = constructor!(key);
    return chord;
  }

  factory Chord.getChordFromSemitonesFormula(
    Note key,
    List<int> semitonesList,
  ) {
    return Chord(
      key,
      semitonesList.map((semitones) => key + semitones).toList(),
    );
  }

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
          note,
          chordTypeToSemitonesFormula[chordType]!,
        ),
  /* example
  ChordType.major: (note) => Chord.getChordFromSemitonesFormula(
        note,
        chordTypeToSemitonesFormula[ChordType.major]!,
      ),
  */
};
