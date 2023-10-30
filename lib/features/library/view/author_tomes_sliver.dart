import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/library/view/view.dart';
import 'package:flutter/material.dart';

class AuthorTomesSliver extends StatelessWidget {
  AuthorTomesSliver({required this.authorTomes, super.key}) {
    _entries = authorTomes.fold(
      <dynamic>[],
      (previousValue, element) => [
        ...previousValue,
        element.key,
        ...element.value.values,
      ],
    );
  }

  final Iterable<MapEntry<String, LinkedHashMap<String, CachedTome>>>
      authorTomes;
  late final List<dynamic> _entries;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => switch (_entries[index]) {
        final String author => AuthorListTile(author: author),
        final CachedTome tome => TomeListTile(tome: tome),
        _ => throw Exception('Unexpected type'),
      },
      itemCount: _entries.length,
    );
  }
}
