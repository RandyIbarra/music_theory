///
/// Natural case: All note names (Equal temperament system)
///
enum NoteName {
  /// C - Do
  c,
  cSharp,

  /// D - Re
  d,
  dSharp,

  /// E - Mi
  e,

  /// F - Fa
  f,
  fSharp,

  /// G - Sol
  g,
  gSharp,

  /// A - La
  a,
  aSharp,

  /// B - Si
  b,
}

List<String> allNotes = [
  'C',
  'C#',
  'D',
  'D#',
  'E',
  'F',
  'F#',
  'G',
  'G#',
  'A',
  'A#',
  'B',
];

String getNoteFromNoteName(NoteName noteName) {
  String name = '';
  switch (noteName) {
    case NoteName.c:
      name = 'C';
      break;
    case NoteName.cSharp:
      name = 'C#';
      break;
    case NoteName.d:
      name = 'D';
      break;
    case NoteName.dSharp:
      name = 'D#';
      break;
    case NoteName.e:
      name = 'E';
      break;
    case NoteName.f:
      name = 'F';
      break;
    case NoteName.fSharp:
      name = 'F#';
      break;
    case NoteName.g:
      name = 'G';
      break;
    case NoteName.gSharp:
      name = 'G#';
      break;
    case NoteName.a:
      name = 'A';
      break;
    case NoteName.aSharp:
      name = 'A#';
      break;
    case NoteName.b:
      name = 'B';
      break;
  }
  return name;
}

///
/// Flat case: All note names (Equal temperament system)
///
enum FlatNoteName {
  /// C - Do
  c,

  /// D - Re
  dFlat,
  d,

  /// E - Mi
  eFlat,
  e,

  /// F - Fa
  f,

  /// G - Sol
  gFlat,
  g,

  /// A - La
  aFlat,
  a,

  /// B - Si
  bFlat,
  b,
}

List<String> allNotesFlat = [
  'C',
  'Db',
  'D',
  'Eb',
  'E',
  'F',
  'Gb',
  'G',
  'Ab',
  'A',
  'Bb',
  'B',
];

String getNoteFromFlatNoteName(FlatNoteName noteName) {
  String name = '';
  switch (noteName) {
    case FlatNoteName.c:
      name = 'C';
      break;
    case FlatNoteName.dFlat:
      name = 'Db';
      break;
    case FlatNoteName.d:
      name = 'D';
      break;
    case FlatNoteName.eFlat:
      name = 'Eb';
      break;
    case FlatNoteName.e:
      name = 'E';
      break;
    case FlatNoteName.f:
      name = 'F';
      break;
    case FlatNoteName.gFlat:
      name = 'Gb';
      break;
    case FlatNoteName.g:
      name = 'G';
      break;
    case FlatNoteName.aFlat:
      name = 'Ab';
      break;
    case FlatNoteName.a:
      name = 'A';
      break;
    case FlatNoteName.bFlat:
      name = 'Bb';
      break;
    case FlatNoteName.b:
      name = 'B';
      break;
  }
  return name;
}
