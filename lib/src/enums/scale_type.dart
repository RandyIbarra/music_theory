enum ScaleType {
  major,
  dorian,
  phrygian,
  lydian,
  mixolydian,
  minor,
  locrian,
  //
  chromatic;

  /// Property to get display name with first letter capitalized
  String get displayName {
    return name[0].toUpperCase() + name.substring(1);
  }
}

/// Converts a string to its corresponding ScaleType enum.
///
/// The function matches the string against enum names case-insensitively.
/// Returns null if no matching enum is found.
///
/// Example:
/// ```dart
/// final scaleType = stringToScaleType('minor'); // Returns ScaleType.minor
/// final scaleType2 = stringToScaleType('Minor'); // Also returns ScaleType.minor
/// final scaleType3 = stringToScaleType('invalid'); // Returns null
/// ```
ScaleType? stringToScaleType(String input) {
  // Convert input to lowercase for case-insensitive matching
  final lowercaseInput = input.toLowerCase();

  // Try to find a matching enum value
  try {
    return ScaleType.values.firstWhere(
      (scale) => scale.name.toLowerCase() == lowercaseInput,
    );
  } catch (e) {
    // Return null if no matching enum is found
    return null;
  }
}

/// Alternative implementation that doesn't use exceptions for control flow
ScaleType? stringToScaleTypeAlt(String input) {
  // Convert input to lowercase for case-insensitive matching
  final lowercaseInput = input.toLowerCase();

  // Find matching enum or return null
  for (final scale in ScaleType.values) {
    if (scale.name.toLowerCase() == lowercaseInput) {
      return scale;
    }
  }

  return null;
}
