import 'package:music_theory/src/enums/scale_type.dart';
import 'package:music_theory/src/functions/semitone_formula_to_scale_type.dart';
import 'package:music_theory/src/note/note_names.dart';
import 'package:music_theory/src/scale/scale_registry.dart';

import '../note/note.dart';

/// Simple dart implementation of a music scale objet.
/// A [Scale] consists of a key [Note] and a code wich is used to build the set
/// of [Note]'s of the scale.
class Scale {
  /// Key note of scale
  Note key;

  /// Notes in scale
  List<Note> notes;

  /// Scale type
  ScaleType type;

  /// Internal constructor to use in factories.
  Scale(this.key, this.notes, this.type);

  ///
  /// General constructors
  ///

  /// Scale constructor from key note and mode.
  factory Scale.getChordFromMode(Note key, ScaleType type) {
    /// Get the constructor from the registry.
    final constructor = scaleRegistry[type];

    /// Make the scale.
    final scale = constructor!(key);
    return scale;
  }

  /// A scale consist of a key [Note] and a code.
  factory Scale.getScaleFromSemitonesFormula({
    required Note key,
    required List<int> code,
    bool useFlat = false,
    ScaleType? scaleType,
  }) {
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
    return Scale(key, notes, scaleType ?? semitoneFormulaToScaleType(code));
  }

  ///
  /// Scale constructors
  ///

  /// Major scale constructor from key [Note].
  factory Scale.getMajor(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[2, 2, 1, 2, 2, 2, 1],
          scaleType: ScaleType.major,
          useFlat: useFlat);

  /// Dorian scale constructor from key [Note].
  factory Scale.getDorian(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[2, 1, 2, 2, 2, 1, 2],
          scaleType: ScaleType.dorian,
          useFlat: useFlat);

  /// Phrygian scale constructor from key [Note].
  factory Scale.getPhrygian(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[1, 2, 2, 2, 1, 2, 2],
          scaleType: ScaleType.phrygian,
          useFlat: useFlat);

  /// Lydian scale constructor from key [Note].
  factory Scale.getLydian(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[2, 2, 2, 1, 2, 2, 1],
          scaleType: ScaleType.lydian,
          useFlat: useFlat);

  /// Mixolydian scale constructor from key [Note].
  factory Scale.getMixolydian(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[2, 2, 1, 2, 2, 1, 2],
          scaleType: ScaleType.mixolydian,
          useFlat: useFlat);

  /// Minor scale constructor from key [Note].
  factory Scale.getMinor(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[2, 1, 2, 2, 1, 2, 2],
          scaleType: ScaleType.minor,
          useFlat: useFlat);

  /// Locrian scale constructor from key [Note].
  factory Scale.getLocrian(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[1, 2, 2, 1, 2, 2, 2],
          scaleType: ScaleType.locrian,
          useFlat: useFlat);

  /// Chromatic scale constructor from key note.
  factory Scale.getChromatic(Note key, {bool useFlat = false}) =>
      Scale.getScaleFromSemitonesFormula(
          key: key,
          code: <int>[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
          scaleType: ScaleType.chromatic,
          useFlat: useFlat);

  /// Scale constructor from key [Note] and a mode.
  factory Scale.getScaleFromType(
    Note key,
    ScaleType type, {
    bool useFlat = false,
  }) {
    late Scale Function(Note) constructor;

    /// Try to get the constructor from the registry.
    try {
      if (useFlat) {
        constructor = scaleRegistryFlat[type]!;
      } else {
        constructor = scaleRegistry[type]!;
      }
    } catch (e) {
      throw 'Type $type not found';
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
    required ScaleType type,
    bool useFlat = false,
  }) =>
      Scale.getScaleFromType(note, type, useFlat: useFlat);
}
