import 'note_names.dart';

/// Dart implementation of a musical note.
class GuitarNote {
  /// Note name
  String name;

  /// Position in the [allNotes]/[allNotesFlat] array.
  int position;

  GuitarNote.internal(
    this.name,
    this.position,
  );

  factory GuitarNote.fromNoteName(NoteName noteName) {
    String name = getNoteFromNoteName(noteName);
    if (allNotes.contains(name)) {
      return GuitarNote.internal(name, allNotes.indexOf(name));
    } else if (allNotesFlat.contains(name)) {
      return GuitarNote.internal(name, allNotesFlat.indexOf(name));
    } else {
      throw 'Error: Note does not exist';
    }
  }

  factory GuitarNote(String name) {
    if (allNotes.contains(name)) {
      return GuitarNote.internal(name, allNotes.indexOf(name));
    } else if (allNotesFlat.contains(name)) {
      return GuitarNote.internal(name, allNotesFlat.indexOf(name));
    } else {
      throw 'Error: Note does not exist';
    }
  }

  /// A Note type object supports the addition or subtraction of semitones
  /// resulting in another note.
  GuitarNote operator +(int semitones) {
    int newValue = (position + semitones + allNotes.length) % allNotes.length;
    return GuitarNote.internal(allNotes[newValue], newValue);
  }

  /// A Note type object supports the addition or subtraction of semitones
  /// resulting in another note.
  GuitarNote operator -(int semitones) {
    int newValue = (position - semitones + allNotes.length) % allNotes.length;
    return GuitarNote.internal(allNotes[newValue], newValue);
  }

  /// Compares current note with other. Missing to overload == operator.
  bool isEqualTo(GuitarNote note) {
    return name == note.name || position == note.position;
  }

  bool isSharp() => name.contains('#') || allNotes[position].contains('#');
  bool isFlat() => name.contains('b') || allNotesFlat[position].contains('b');

  void toSharp() {
    position++;
    position %= allNotes.length;
    name = allNotes[position];
  }

  void toFlat() {
    position--;
    position += allNotes.length; // negative case
    position %= allNotes.length;
    name = allNotesFlat[position];
  }

  void addSemitones(int semitones) {
    position = (position + semitones + allNotes.length) % allNotes.length;
    name = allNotes[position];
  }

  void removeSemitones(int semitones) {
    position = (position - semitones + allNotes.length) % allNotes.length;
    name = allNotesFlat[position];
  }
}
