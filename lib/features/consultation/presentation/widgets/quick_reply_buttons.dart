import 'package:flutter/material.dart';
import '../../../../core/constants/app_theme.dart';

class QuickReplyButtons extends StatelessWidget {
  const QuickReplyButtons({
    super.key,
    required this.options,
    required this.onSelected,
    this.enabled = true,
  });

  final List<String> options;
  final void Function(String) onSelected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    if (options.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: options.map((option) {
          return ActionChip(
            label: Text(option),
            onPressed: enabled ? () => onSelected(option) : null,
            backgroundColor: AppTheme.primary.withValues(alpha: 0.1),
            labelStyle: TextStyle(color: enabled ? AppTheme.primary : Colors.grey),
            side: BorderSide(
              color: enabled ? AppTheme.primary.withValues(alpha: 0.3) : Colors.grey.shade300,
            ),
          );
        }).toList(),
      ),
    );
  }
}
