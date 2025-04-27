import 'package:music_theory/music_theory.dart';

/// You can get the constructor by var _constructor = scaleRegistry['major'].
/// And then, make your major scale by var _scale = _constructor(Note('C')).
Map<ScaleType, Scale Function(GuitarNote)> scaleRegistry = {
  ScaleType.major: (note) => Scale.getMajor(note),
  ScaleType.dorian: (note) => Scale.getDorian(note),
  ScaleType.phrygian: (note) => Scale.getPhrygian(note),
  ScaleType.lydian: (note) => Scale.getLydian(note),
  ScaleType.mixolydian: (note) => Scale.getMixolydian(note),
  ScaleType.minor: (note) => Scale.getMinor(note),
  ScaleType.locrian: (note) => Scale.getLocrian(note),
  ScaleType.chromatic: (note) => Scale.getChromatic(note),
};

Map<ScaleType, Scale Function(GuitarNote)> scaleRegistryFlat = {
  ScaleType.major: (note) => Scale.getMajor(note, useFlat: true),
  ScaleType.dorian: (note) => Scale.getDorian(note, useFlat: true),
  ScaleType.phrygian: (note) => Scale.getPhrygian(note, useFlat: true),
  ScaleType.lydian: (note) => Scale.getLydian(note, useFlat: true),
  ScaleType.mixolydian: (note) => Scale.getMixolydian(note, useFlat: true),
  ScaleType.minor: (note) => Scale.getMinor(note, useFlat: true),
  ScaleType.locrian: (note) => Scale.getLocrian(note, useFlat: true),
  ScaleType.chromatic: (note) => Scale.getChromatic(note, useFlat: true),
};
