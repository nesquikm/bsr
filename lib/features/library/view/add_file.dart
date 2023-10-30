import 'package:bsr/app/app.dart';
import 'package:bsr/features/library/library.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

Future<void> addFile({
  required WidgetRef ref,
}) async {
  final log = Logger('addFile');

  final result = await FilePicker.platform.pickFiles(
      // TODO(nesquikm): Why it doesn't work?
      // type: FileType.custom,
      // allowedExtensions: Tome.supportedExtensions(),
      // allowMultiple: true,
      );

  if (result == null) {
    log.info('No file selected');
    return;
  }

  final files = result.files;

  log.info('Selected ${files.length} files');

  final provider = ref.read(tomeLibraryProvider.notifier);

  var added = 0;
  var failed = 0;

  for (final file in files) {
    final path = file.path;
    if (path == null) {
      log.severe('File path is null for file $file');
      failed++;
      continue;
    }

    final String id;
    try {
      id = await provider.addFile(path);
    } catch (e, s) {
      log.severe('Failed to add file $path', e, s);
      failed++;
      continue;
    }
    log.info('Added file $path with id $id');
    added++;
  }

  final context = GlobalKeys.rootNavigatorKey.currentContext!;

  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added $added files, failed to add $failed files'),
      ),
    );
  }
}
