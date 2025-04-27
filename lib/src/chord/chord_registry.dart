import 'package:music_theory/music_theory.dart';

/// You can get the constructor by var _constructor = chordRegistry['major'].
/// And then, make your major chord by var _chord = _constructor(Note('C')).
Map<ChordType, Chord Function(GuitarNote)> chordRegistry = {
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
