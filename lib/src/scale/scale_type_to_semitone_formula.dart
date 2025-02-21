import 'package:music_theory/src/enums/scale_type.dart';

const scaleTypeToSemitonesFormula = <ScaleType, List<int>>{
  ScaleType.major: <int>[2, 2, 1, 2, 2, 2, 1],
  ScaleType.dorian: <int>[2, 1, 2, 2, 2, 1, 2],
  ScaleType.phrygian: <int>[1, 2, 2, 2, 1, 2, 2],
  ScaleType.lydian: <int>[2, 2, 2, 1, 2, 2, 1],
  ScaleType.mixolydian: <int>[2, 2, 1, 2, 2, 1, 2],
  ScaleType.minor: <int>[2, 1, 2, 2, 1, 2, 2],
  ScaleType.locrian: <int>[1, 2, 2, 1, 2, 2, 2],
  ScaleType.chromatic: <int>[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
};
