import 'package:music_theory/music_theory.dart';
// external packages
import 'package:test/test.dart';

void main() {
  group('Testing Note: ', () {
    final note = GuitarNote('C');

    setUp(() {
      // Additional setup goes here.
    });

    test('Correct init name ${note.name}', () {
      expect(note.name, 'C');
    });

    test('To sharp ${note.name}', () {
      final naturalName = note.name[0];
      final auxNote = GuitarNote(naturalName);
      final sharp = auxNote + 1;
      print(' sharp: ${sharp.name}');
      expect(
        sharp.isSharp(),
        (naturalName == 'B' || naturalName == 'E') ? false : true,
      );
    });

    test('To flat ${note.name}', () {
      final naturalName = note.name[0];
      final auxNote = GuitarNote(naturalName);
      final flat = auxNote - 1;
      print(' flatten: ${flat.name}');
      expect(
        flat.isFlat(),
        (naturalName == 'C' || naturalName == 'F') ? false : true,
      );
    });
  });
}
