import 'package:bsr/app/router/router.dart';
import 'package:bsr/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LibraryTomesPage extends ConsumerStatefulWidget {
  const LibraryTomesPage({super.key});

  @override
  ConsumerState<LibraryTomesPage> createState() => _LibraryTomesPageState();
}

class _LibraryTomesPageState extends ConsumerState<LibraryTomesPage> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.libraryTomesAppBarTitle)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              ref.goFurther(AppRoute.reader);
            },
            child: Text(l10n.readerAppBarTitle),
          ),
          TextButton(
            onPressed: () {
              ref.goFurther(AppRoute.settings);
            },
            child: Text(l10n.settingsAppBarTitle),
          ),
        ],
      ),
    );
  }
}
