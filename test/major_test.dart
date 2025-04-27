import 'package:music_theory/music_theory.dart';
import 'package:test/test.dart';

void main() {
  const cMajorMessage =
      'getChordFromMode creates correct major scale for (Note("C"), ScaleType.major)';
  const dMajorMessage =
      'getChordFromMode creates correct major scale for (Note("D"), ScaleType.major)';
  const eMajorMessage =
      'getChordFromMode creates correct major scale for (Note("E"), ScaleType.major)';
  const fMajorMessage =
      'getChordFromMode creates correct major scale for (Note("F"), ScaleType.major)';
  const gMajorMessage =
      'getChordFromMode creates correct major scale for (Note("G"), ScaleType.major)';
  const aMajorMessage =
      'getChordFromMode creates correct major scale for (Note("A"), ScaleType.major)';
  const bMajorMessage =
      'getChordFromMode creates correct major scale for (Note("B"), ScaleType.major)';
  group('Scale', () {
    test(cMajorMessage, () {
      // Act
      final cMajorScale = Scale.getChordFromMode(
        GuitarNote('C'),
        ScaleType.major,
      );

      // Assert
      expect(cMajorScale.key.name, equals('C'));
      expect(cMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = cMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C', 'D', 'E', 'F', 'G', 'A', 'B']));
    });
    test(dMajorMessage, () {
      // Act
      final dMajorScale = Scale.getChordFromMode(
        GuitarNote('D'),
        ScaleType.major,
      );

      // Assert
      expect(dMajorScale.key.name, equals('D'));
      expect(dMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = dMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C#', 'D', 'E', 'F#', 'G', 'A', 'B']));
    });
    test(eMajorMessage, () {
      // Act
      final eMajorScale = Scale.getChordFromMode(
        GuitarNote('E'),
        ScaleType.major,
      );

      // Assert
      expect(eMajorScale.key.name, equals('E'));
      expect(eMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = eMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C#', 'D#', 'E', 'F#', 'G#', 'A', 'B']));
    });
    test(fMajorMessage, () {
      // Act
      final fMajorScale = Scale.getChordFromMode(
        GuitarNote('F'),
        ScaleType.major,
      );

      // Assert
      expect(fMajorScale.key.name, equals('F'));
      expect(fMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = fMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C', 'D', 'E', 'F', 'G', 'A', 'Bb']));
    });
    test(gMajorMessage, () {
      // Act
      final gMajorScale = Scale.getChordFromMode(
        GuitarNote('G'),
        ScaleType.major,
      );

      // Assert
      expect(gMajorScale.key.name, equals('G'));
      expect(gMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = gMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C', 'D', 'E', 'F#', 'G', 'A', 'B']));
    });
    test(aMajorMessage, () {
      // Act
      final aMajorScale = Scale.getChordFromMode(
        GuitarNote('A'),
        ScaleType.major,
      );

      // Assert
      expect(aMajorScale.key.name, equals('A'));
      expect(aMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = aMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C#', 'D', 'E', 'F#', 'G#', 'A', 'B']));
    });
    test(bMajorMessage, () {
      // Act
      final bMajorScale = Scale.getChordFromMode(
        GuitarNote('B'),
        ScaleType.major,
      );

      // Assert
      expect(bMajorScale.key.name, equals('B'));
      expect(bMajorScale.type, equals(ScaleType.major));

      // Check if all notes in the scale are correct
      final noteNames = bMajorScale.notes.map((note) => note.name).toList();
      expect(noteNames, equals(['C#', 'D#', 'E', 'F#', 'G#', 'A#', 'B']));
    });
  });
}
