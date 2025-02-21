import 'package:music_theory/src/mode.dart';
import 'package:music_theory/src/note_names.dart';
import 'package:music_theory/src/scale/scale_registry.dart';

import '../note.dart';

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
  factory Scale(Note key, List<int> code, {bool useFlat = false}) {
    List<Note> notes = [key];
    Note note = key;
    for (int semitones in code) {
      note = note + semitones;
      // check if note was added
      for (int i = 0; i < notes.length; i++) {
        if (notes[i].name[0] == note.name[0]) {
          if (useFlat) {
            note.name = allNotesFlat[note.position];
          } else {
            note.name = allNotes[note.position];
          }
          break;
        }
      }
      notes.add(note);
    }
    if (notes.first == notes.last) {
      notes.removeLast();
    }
    return Scale.internal(key, notes);
  }

  /// Major scale constructor from key [Note].
  factory Scale.getMajor(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[2, 2, 1, 2, 2, 2, 1], useFlat: useFlat);
  }

  /// Dorian scale constructor from key [Note].
  factory Scale.getDorian(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[2, 1, 2, 2, 2, 1, 2], useFlat: useFlat);
  }

  /// Phrygian scale constructor from key [Note].
  factory Scale.getPhrygian(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[1, 2, 2, 2, 1, 2, 2], useFlat: useFlat);
  }

  /// Lydian scale constructor from key [Note].
  factory Scale.getLydian(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[2, 2, 2, 1, 2, 2, 1], useFlat: useFlat);
  }

  /// Mixolydian scale constructor from key [Note].
  factory Scale.getMixolydian(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[2, 2, 1, 2, 2, 1, 2], useFlat: useFlat);
  }

  /// Minor scale constructor from key [Note].
  factory Scale.getMinor(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[2, 1, 2, 2, 1, 2, 2], useFlat: useFlat);
  }

  /// Locrian scale constructor from key [Note].
  factory Scale.getLocrian(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[1, 2, 2, 1, 2, 2, 2], useFlat: useFlat);
  }

  /// Chromatic scale constructor from key note.
  factory Scale.getChromatic(Note key, {bool useFlat = false}) {
    return Scale(key, <int>[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
        useFlat: useFlat);
  }

  /// Scale constructor from key [Note] and a mode.
  factory Scale.getScaleFromMode(
    Note key,
    ScaleMode mode, {
    bool useFlat = false,
  }) {
    late Scale Function(Note) constructor;

    /// Try to get the constructor from the registry.
    try {
      if (useFlat) {
        constructor = scaleRegistryFlat[mode]!;
      } else {
        constructor = scaleRegistry[mode]!;
      }
    } catch (e) {
      throw 'Mode $mode not found';
    }

    final scale = constructor(key);
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

  bool isFlatInThisScale(Note queryNote) {
    if (!hasNote(queryNote)) {
      //throw 'This Scale does not have ${queryNote.name}';
      return false;
    }
    for (Note note in notes) {
      if (note.isEqualTo(queryNote) && note.isFlat()) {
        return true;
      }
    }

    return false;
  }

  bool isSharpInThisScale(Note queryNote) {
    if (!hasNote(queryNote)) {
      //throw 'This Scale does not have ${queryNote.name}';
      return false;
    }
    for (Note note in notes) {
      if (note.isEqualTo(queryNote) && note.isSharp()) {
        return true;
      }
    }

    return false;
  }

  bool isKey(Note note) {
    return notes[0].isEqualTo(note);
  }

  factory Scale.fromMode({
    required Note note,
    required ScaleMode mode,
    bool useFlat = false,
  }) =>
      Scale.getScaleFromMode(note, mode, useFlat: useFlat);
}
