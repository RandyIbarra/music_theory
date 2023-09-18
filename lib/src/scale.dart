import 'note.dart';

/// Modes of a scale.
List<String> scaleModes = [
  'major',
  'dorian',
  'phrygian',
  'lydian',
  'mixolydean',
  'minor',
  'locrian',
  'chromatic',
];

/// Simple dart implementation of a music scale objet.
/// A [Scale] consists of a key [Note] and a code wich is used to build the set
/// of [Note]'s of the scale.
class Scale {
  /// Key note of scale
  Note key;

  /// Notes in scale
  List<Note> notes;

  /// Internal constructor to use in factories.
  Scale.internal(this.key, this.notes);

  /// A scale consist of a key [Note] and a code.
  factory Scale(Note key, List<int> code) {
    List<Note> notes = [key];
    Note note = key;
    for (int semitones in code) {
      note = note + semitones;
      notes.add(note);
    }
    if (notes.first == notes.last) {
      notes.removeLast();
    }
    return Scale.internal(key, notes);
  }

  /// Major scale constructor from key [Note].
  factory Scale.getMajor(Note key) {
    return Scale(key, <int>[2, 2, 1, 2, 2, 2, 1]);
  }

  /// Dorian scale constructor from key [Note].
  factory Scale.getDorian(Note key) {
    return Scale(key, <int>[2, 1, 2, 2, 2, 1, 2]);
  }

  /// Phrygian scale constructor from key [Note].
  factory Scale.getPhrygian(Note key) {
    return Scale(key, <int>[1, 2, 2, 2, 1, 2, 2]);
  }

  /// Lydian scale constructor from key [Note].
  factory Scale.getLydian(Note key) {
    return Scale(key, <int>[2, 2, 2, 1, 2, 2, 1]);
  }

  /// Mixolydian scale constructor from key [Note].
  factory Scale.getMixolydian(Note key) {
    return Scale(key, <int>[2, 2, 1, 2, 2, 1, 2]);
  }

  /// Minor scale constructor from key [Note].
  factory Scale.getMinor(Note key) {
    return Scale(key, <int>[2, 1, 2, 2, 1, 2, 2]);
  }

  /// Locrian scale constructor from key [Note].
  factory Scale.getLocrian(Note key) {
    return Scale(key, <int>[1, 2, 2, 1, 2, 2, 2]);
  }

  /// Chromatic scale constructor from key note.
  factory Scale.getChromatic(Note key) {
    return Scale(key, <int>[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]);
  }

  /// Scale constructor from key [Note] and a mode.
  factory Scale.getScaleFromMode(Note key, String mode) {
    final constructor = scaleRegistry[mode];
    final scale = constructor!(key);
    return scale;
  }

  bool hasNote(Note queryNote) {
    for (Note note in notes) {
      if (note.isEqualTo(queryNote)) {
        return true;
      }
    }
    return false;
  }

  bool isKey(Note note) {
    return notes[0].isEqualTo(note);
  }
}

/// You can get the constructor by var _constructor = scaleRegistry['major'].
/// And then, make your major scale by var _scale = _constructor(Note('C')).
Map<String, Scale Function(Note)> scaleRegistry = {
  "major": (note) => Scale.getMajor(note),
  "dorian": (note) => Scale.getDorian(note),
  "phrygian": (note) => Scale.getPhrygian(note),
  "lydian": (note) => Scale.getLydian(note),
  "mixolydean": (note) => Scale.getMixolydian(note),
  "minor": (note) => Scale.getMinor(note),
  "locrian": (note) => Scale.getLocrian(note),
  "chromatic": (note) => Scale.getChromatic(note),
};
