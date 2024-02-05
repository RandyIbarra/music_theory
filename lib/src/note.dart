import 'note_names.dart';

/// Dart implementation of a musical note.
class Note {
  /// Note name
  String name;

  /// Position in the [allNotes]/[allNotesFlat] array.
  int position;

  Note.internal(
    this.name,
    this.position,
  );

  factory Note(String name) {
    if (allNotes.contains(name)) {
      return Note.internal(name, allNotes.indexOf(name));
    } else if (allNotesFlat.contains(name)) {
      return Note.internal(name, allNotesFlat.indexOf(name));
    } else {
      throw 'Error: Note does not exist';
    }
  }

  /// A Note type object supports the addition or subtraction of semitones
  /// resulting in another note.
  Note operator +(int semitones) {
    int newValue = (position + semitones + allNotes.length) % allNotes.length;
    return Note.internal(allNotes[newValue], newValue);
  }

  /// A Note type object supports the addition or subtraction of semitones
  /// resulting in another note.
  Note operator -(int semitones) {
    int newValue = (position - semitones + allNotes.length) % allNotes.length;
    return Note.internal(allNotes[newValue], newValue);
  }

  /// Compares current note with other. Missing to overload == operator.
  bool isEqualTo(Note note) {
    return name == note.name || position == note.position;
  }

  bool isSharp() => name.contains('#') || allNotes[position].contains('#');
  bool isFlat() => name.contains('b') || allNotesFlat[position].contains('b');
}
