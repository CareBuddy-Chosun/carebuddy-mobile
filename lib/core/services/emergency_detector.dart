/// Client-side emergency keyword detection (SRS FR-015).
/// Runs synchronously before sending messages to backend.
class EmergencyDetector {
  EmergencyDetector._();

  static const List<String> emergencyKeywords = [
    "can't breathe",
    'cannot breathe',
    'difficulty breathing',
    'chest pain',
    'heart attack',
    'stroke',
    'unconscious',
    'not responding',
    'severe bleeding',
    'fainting',
    'passed out',
    'seizure',
    'overdose',
    'suicide',
    'suicidal',
  ];

  /// Returns matched emergency keywords found in the text.
  /// Empty list means no emergency detected.
  static List<String> check(String text) {
    final lower = text.toLowerCase();
    return emergencyKeywords.where((kw) => lower.contains(kw)).toList();
  }
}
