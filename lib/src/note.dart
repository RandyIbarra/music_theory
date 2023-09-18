/// All note names (Equal temperament system)
List<String> allNotes = [
  'C',
  'C#',
  'D',
  'D#',
  'E',
  'F',
  'F#',
  'G',
  'G#',
  'A',
  'A#',
  'B',
];

/// All note names (Equal temperament system)
List<String> allNotesFlat = [
  'C',
  'Db',
  'D',
  'Eb',
  'E',
  'F',
  'Gb',
  'G',
  'Ab',
  'A',
  'Bb',
  'B',
];

/// Dart implementation of a musical note.
class Note {
  /// Note name
  String name;

  /// Position in the [allNotes] array.
  int position;

  Note.internal(this.name, this.position);

  factory Note(String name) {
    if (allNotes.contains(name)) {
      return Note.internal(name, allNotes.indexOf(name));
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
    return name == note.name;
  }
}
