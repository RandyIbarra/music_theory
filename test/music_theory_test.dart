import 'package:music_theory/music_theory.dart';
// external packages
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final note = Note('C');

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(note.name, 'C');
    });
  });
}
