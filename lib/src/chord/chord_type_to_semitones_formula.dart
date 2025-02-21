import 'package:music_theory/src/chord/chord_type.dart';

const chordTypeToSemitonesFormula = <ChordType, List<int>>{
  ChordType.major: [0, 4, 7], // 1, 3, 5
  ChordType.minor: [0, 3, 7], // 1, B3, 5
  ChordType.augmented: [0, 4, 8], // 1, 3, #5
  ChordType.diminished: [0, 3, 6], // 1, B3, B5
  ChordType.major7: [0, 4, 7, 11], // 1, 3, 5, 7
  ChordType.minor7: [0, 3, 7, 10], // 1, B3, 5, B7
  ChordType.dominant7: [0, 4, 7, 10], // 1, 3, 5, B7
  ChordType.augmented7: [0, 4, 8, 10], // 1, 3, #5, B7
  ChordType.dominant7b5: [0, 4, 6, 10], // 1, 3, B5, B7
  ChordType.minorMaj7: [0, 3, 7, 11], // 1, B3, 5, 7
  ChordType.halfDiminished: [0, 3, 6, 10], // 1, B3, B5, B7
  ChordType.diminished7: [0, 3, 6, 9], // 1, B3, B5, BB7
};
