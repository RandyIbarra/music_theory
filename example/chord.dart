import 'package:music_theory/music_theory.dart';
import 'package:music_theory/src/enums/chord_type.dart';

void main() {
  final chord = Chord.getChordFromMode(Note('C'), ChordType.major);
  print(
      'Chord: ${chord.key.name}, ${chord.notes.map((note) => note.name).join(' ')}, ${chord.type.name}');
}
