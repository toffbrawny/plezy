import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:provider/provider.dart';

import '../../i18n/strings.g.dart';
import '../../providers/seer_provider.dart';
import '../../widgets/app_icon.dart';

class SeerLoginSheet extends StatefulWidget {
  const SeerLoginSheet({super.key});

  @override
  State<SeerLoginSheet> createState() => _SeerLoginSheetState();
}

class _SeerLoginSheetState extends State<SeerLoginSheet> {
  final _urlController = TextEditingController();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool _useJellyfinAuth = true;
  bool _obscurePassword = true;
  bool _verifying = false;

  @override
  void dispose() {
    _urlController.dispose();
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final url = _urlController.text.trim();
    final username = _userController.text.trim();
    final password = _passController.text;

    if (url.isEmpty || username.isEmpty || password.isEmpty) return;

    final provider = context.read<SeerProvider>();
    final success = await provider.login(
      serverUrl: url,
      username: username,
      password: password,
      useJellyfinAuth: _useJellyfinAuth,
    );

    if (!mounted) return;
    if (success) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SeerProvider>();

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              t.seer.login,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),

            // Server URL
            TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: t.seer.serverUrl,
                hintText: 'https://jellyseerr.example.com',
                prefixIcon: const AppIcon(Symbols.link_rounded),
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.url,
              autocorrect: false,
            ),
            const SizedBox(height: 16),

            // Login method selector
            Text(t.seer.loginMethod, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            SegmentedButton<bool>(
              segments: [
                ButtonSegment(value: true, label: Text(t.seer.jellyfinLogin)),
                ButtonSegment(value: false, label: Text(t.seer.localLogin)),
              ],
              selected: {_useJellyfinAuth},
              onSelectionChanged: (selection) {
                setState(() => _useJellyfinAuth = selection.first);
              },
            ),
            const SizedBox(height: 16),

            // Username/Email
            TextField(
              controller: _userController,
              decoration: InputDecoration(
                labelText: _useJellyfinAuth ? t.seer.username : 'Email',
                prefixIcon: const AppIcon(Symbols.person_rounded),
                border: const OutlineInputBorder(),
              ),
              autocorrect: false,
            ),
            const SizedBox(height: 16),

            // Password
            TextField(
              controller: _passController,
              decoration: InputDecoration(
                labelText: t.seer.password,
                prefixIcon: const AppIcon(Symbols.lock_rounded),
                suffixIcon: IconButton(
                  icon: AppIcon(_obscurePassword ? Symbols.visibility_rounded : Symbols.visibility_off_rounded),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
                border: const OutlineInputBorder(),
              ),
              obscureText: _obscurePassword,
              onSubmitted: (_) => _login(),
            ),
            const SizedBox(height: 16),

            // Error
            if (provider.error != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  provider.error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                ),
              ),

            const SizedBox(height: 16),

            // Login button
            FilledButton(
              onPressed: provider.isAuthenticating ? null : _login,
              child: provider.isAuthenticating
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        const SizedBox(width: 8),
                        Text(t.seer.loggingIn),
                      ],
                    )
                  : Text(t.seer.loginButton),
            ),
          ],
        ),
      ),
    );
  }
}