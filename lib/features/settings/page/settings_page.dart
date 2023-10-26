import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Settings'),
          TextButton(
            onPressed: () {
              Logger('sasasa').config('ddff');
              Logger.root.clearListeners();
            },
            child: const Text('Reader'),
          ),
        ],
      ),
    );
  }
}
