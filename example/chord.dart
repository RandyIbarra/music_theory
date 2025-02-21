import 'package:music_theory/music_theory.dart';

void main() {
  final chord = Chord.getChordFromMode(Note('C'), ChordType.major);
  print('Chord: ${chord.key.name}, ${chord.notes.map((note) => note.name).join(' ')}, ${chord.type.name}');
}
