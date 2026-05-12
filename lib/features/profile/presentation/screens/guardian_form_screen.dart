import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../core/utils/validators.dart';
import '../../../../shared/models/user_models.dart';
import '../providers/profile_provider.dart';

class GuardianFormScreen extends ConsumerStatefulWidget {
  const GuardianFormScreen({super.key});

  @override
  ConsumerState<GuardianFormScreen> createState() => _GuardianFormScreenState();
}

class _GuardianFormScreenState extends ConsumerState<GuardianFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _relationshipController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _relationshipController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await ref.read(profileProvider.notifier).addGuardian(
            GuardianCreate(
              name: _nameController.text.trim(),
              phone: _phoneController.text.trim(),
              relationship: _relationshipController.text.trim().isEmpty
                  ? null
                  : _relationshipController.text.trim(),
            ),
          );
      if (mounted) context.pop();
    } on ApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.userMessage), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Guardian')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (v) => Validators.validateRequired(v, 'Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: '+821012345678',
                ),
                validator: Validators.validatePhone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _relationshipController,
                decoration: const InputDecoration(
                  labelText: 'Relationship (optional)',
                  hintText: 'e.g., Parent, Spouse, Friend',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _save,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Save Guardian'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
