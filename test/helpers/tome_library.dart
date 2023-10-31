import 'dart:io';

import 'package:io/io.dart';
import 'package:path/path.dart';

String getTomeLibraryPath() {
  return join(Directory.systemTemp.path, 'bsr_test_tome_library');
}

void createTomeLibraryDirectory() {
  final tomeLibraryPath = getTomeLibraryPath();
  if (!Directory(tomeLibraryPath).existsSync()) {
    Directory(tomeLibraryPath).createSync(recursive: true);
  }
  copyPathSync('test/test_tomes/library', tomeLibraryPath);
}

void deleteTomeLibraryDirectory() {
  final tomeLibraryPath = getTomeLibraryPath();
  if (Directory(tomeLibraryPath).existsSync()) {
    Directory(tomeLibraryPath).deleteSync(recursive: true);
  }
}
