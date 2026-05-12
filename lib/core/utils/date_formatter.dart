import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String formatSessionDate(String? isoDate) {
    if (isoDate == null) return '';
    try {
      final dt = DateTime.parse(isoDate);
      return DateFormat('MMM d, yyyy').format(dt);
    } catch (_) {
      return isoDate.length >= 10 ? isoDate.substring(0, 10) : isoDate;
    }
  }

  static String formatSessionTime(String? isoDate) {
    if (isoDate == null) return '';
    try {
      final dt = DateTime.parse(isoDate);
      return DateFormat('h:mm a').format(dt);
    } catch (_) {
      return '';
    }
  }

  static String formatDuration(int? seconds) {
    if (seconds == null) return '';
    if (seconds < 60) return '${seconds}s';
    final min = seconds ~/ 60;
    final sec = seconds % 60;
    return sec > 0 ? '${min}m ${sec}s' : '${min}m';
  }

  static String formatRelative(String? isoDate) {
    if (isoDate == null) return '';
    try {
      final dt = DateTime.parse(isoDate);
      final now = DateTime.now();
      final diff = now.difference(dt);

      if (diff.inMinutes < 1) return 'Just now';
      if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
      if (diff.inHours < 24) return '${diff.inHours}h ago';
      if (diff.inDays < 7) return '${diff.inDays}d ago';
      return DateFormat('MMM d').format(dt);
    } catch (_) {
      return '';
    }
  }
}
