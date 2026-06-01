import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../shared/models/session_models.dart';

class SessionListTile extends ConsumerWidget {
  const SessionListTile({
    super.key,
    required this.session,
    required this.onTap,
    this.onDelete,
  });

  final SessionSummary session;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(stringsProvider);
    final (icon, color) = switch (session.triageLevel) {
      AppConstants.triageEmergency => (Icons.emergency, AppTheme.emergency),
      AppConstants.triageVisitHospital =>
        (Icons.local_hospital, AppTheme.warning),
      AppConstants.triageHomeCare => (Icons.home, AppTheme.success),
      _ => (Icons.chat_bubble_outline, AppTheme.textSecondary),
    };

    final triageLabel = switch (session.triageLevel) {
      AppConstants.triageEmergency => t.triageEmergency,
      AppConstants.triageVisitHospital => t.triageVisitHospitalShort,
      AppConstants.triageHomeCare => t.triageHomeCareShort,
      _ => null,
    };

    final title = session.primarySymptomTag ?? triageLabel ?? t.inProgress;
    final subtitle =
        session.startedAt != null ? session.startedAt!.substring(0, 10) : '';

    final tile = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            Text(subtitle),
            if (session.durationSeconds != null) ...[
              const Text(' \u00b7 '),
              Text(t.minutesShort((session.durationSeconds! / 60).ceil())),
            ],
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );

    if (onDelete != null) {
      return Dismissible(
        key: Key(session.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          color: AppTheme.emergency,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        confirmDismiss: (_) async {
          return await showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text(t.deleteSession),
              content: Text(t.deleteSessionListContent),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: Text(t.cancel)),
                TextButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: Text(t.delete,
                        style: const TextStyle(color: Colors.red))),
              ],
            ),
          );
        },
        onDismissed: (_) => onDelete!(),
        child: tile,
      );
    }

    return tile;
  }
}
