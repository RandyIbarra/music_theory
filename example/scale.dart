import 'package:music_theory/music_theory.dart';

void main() {
  final scale = Scale.getMajor(GuitarNote('C'));
  print(
      'Scale: ${scale.key.name}, ${scale.notes.map((note) => note.name).join(' ')}, ${scale.type.name}');
}
