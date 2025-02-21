import 'package:music_theory/music_theory.dart';
import 'package:music_theory/src/chord/chord_type.dart';
import 'package:music_theory/src/chord/chord_type_to_semitones_formula.dart';

/// You can get the constructor by var _constructor = chordRegistry['major'].
/// And then, make your major chord by var _chord = _constructor(Note('C')).
Map<ChordType, Chord Function(Note)> chordRegistry = {
  for (ChordType chordType in ChordType.values)
    chordType: (note) => Chord.getChordFromSemitonesFormula(
        key: note,
        semitoneList: chordTypeToSemitonesFormula[chordType]!,
        chordType: chordType),
};

/* example
  ChordType.major: (note) => Chord.getChordFromSemitonesFormula(
        key: note,
        semitoneList: chordTypeToSemitonesFormula[ChordType.major]!,
        chordType: chordType,
      ),
*/
