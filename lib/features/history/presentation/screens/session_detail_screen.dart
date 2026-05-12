import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/network/session_repository.dart';
import '../../../../shared/models/session_models.dart';
import '../../../consultation/presentation/widgets/triage_detail_card.dart';

class SessionDetailScreen extends ConsumerStatefulWidget {
  const SessionDetailScreen({super.key, required this.sessionId});

  final String sessionId;

  @override
  ConsumerState<SessionDetailScreen> createState() =>
      _SessionDetailScreenState();
}

class _SessionDetailScreenState extends ConsumerState<SessionDetailScreen> {
  SessionResponse? _session;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadSession();
  }

  Future<void> _loadSession() async {
    try {
      final repo = ref.read(sessionRepositoryProvider);
      final session = await repo.getSession(widget.sessionId);
      if (mounted) setState(() { _session = session; _isLoading = false; });
    } on ApiException catch (e) {
      if (mounted) setState(() { _error = e.userMessage; _isLoading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = e.toString(); _isLoading = false; });
    }
  }

  Future<void> _deleteSession() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Session'),
        content: const Text('This will permanently delete this session and all its data.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      final repo = ref.read(sessionRepositoryProvider);
      await repo.deleteSession(widget.sessionId);
      if (mounted) context.pop();
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.userMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text('Session Detail')),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Session Detail')),
        body: Center(child: Text(_error!)),
      );
    }

    final session = _session!;
    return Scaffold(
      appBar: AppBar(
        title: Text(session.primarySymptomTag ?? 'Session Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: _deleteSession,
            tooltip: 'Delete Session',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Session metadata
          Row(
            children: [
              if (session.startedAt != null)
                Text(session.startedAt!.substring(0, 10),
                    style: const TextStyle(color: AppTheme.textSecondary)),
              if (session.durationSeconds != null) ...[
                const Text(' \u00b7 ',
                    style: TextStyle(color: AppTheme.textSecondary)),
                Text('${(session.durationSeconds! / 60).ceil()} min',
                    style: const TextStyle(color: AppTheme.textSecondary)),
              ],
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: session.status == 'active'
                      ? Colors.green.shade50
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  session.status.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    color: session.status == 'active'
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Triage result
          if (session.triageLevel != null)
            TriageDetailCard(
              triageResult: TriageResult(
                level: session.triageLevel!,
                explanation: session.triageExplanation,
              ),
              onFindHospitals: () =>
                  context.push('/hospitals', extra: session.triageLevel),
            ),

          // Messages
          const SizedBox(height: 8),
          const Text('Conversation',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          ...session.messages.map((m) => _MessageTile(message: m)),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({required this.message});
  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? AppTheme.primary : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 4),
            bottomRight: Radius.circular(isUser ? 4 : 16),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: const Offset(0, 2))
          ],
        ),
        child: Text(
          message.content,
          style: TextStyle(
            color: isUser ? Colors.white : AppTheme.textPrimary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
