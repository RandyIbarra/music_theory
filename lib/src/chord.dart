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

  factory Chord.getChordFromMode(Note key, String mode, {int nNotes = 3}) {
    final constructor = chordRegistry[mode];
    final chord = constructor!(key);
    return chord;
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

/// You can get the constructor by var _constructor = chordRegistry['major'].
/// And then, make your major chord by var _chord = _constructor(Note('C')).
Map<Mode, Chord Function(Note)> chordRegistry = {
  Mode.major: (note) => Chord.getMajor(note),
  Mode.minor: (note) => Chord.getMinor(note),
  Mode.majorSeventh: (note) => Chord.getMajor7(note),
};
