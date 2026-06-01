import 'package:flutter/material.dart';
import '../../../../core/constants/app_theme.dart';

/// Presentation-only tap-to-talk button used for manual voice input when
/// hands-free voice mode is OFF.
///
/// The actual [SpeechToText] session is owned by the consultation screen so
/// there is only ever one recognizer running (no duplicate listen sessions).
/// This widget just renders the mic state and forwards taps.
class VoiceInputButton extends StatelessWidget {
  const VoiceInputButton({
    super.key,
    required this.isListening,
    required this.onTap,
    this.enabled = true,
  });

  /// Whether the screen's recognizer is currently listening.
  final bool isListening;

  /// Toggle listening on/off.
  final VoidCallback onTap;

  /// Disabled when STT is unavailable / permission denied.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: !enabled
              ? Colors.grey
              : (isListening ? AppTheme.emergency : AppTheme.primary),
        ),
        child: Icon(
          isListening ? Icons.stop : Icons.mic,
          color: Colors.white,
        ),
      ),
    );
  }
}
