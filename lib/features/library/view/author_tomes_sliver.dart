import 'dart:collection';

import 'package:bsr/features/library/library.dart';
import 'package:bsr/features/library/view/view.dart';
import 'package:flutter/material.dart';

SliverList authorTomesSliver({
  required Iterable<MapEntry<String, LinkedHashMap<String, CachedTome>>>
      authorTomes,
}) {
  final entries = authorTomes.fold(
    <dynamic>[],
    (previousValue, element) => [
      ...previousValue,
      element.key,
      ...element.value.values,
    ],
  );

  return SliverList.builder(
    itemBuilder: (context, index) => switch (entries[index]) {
      final String author => AuthorListTile(author: author),
      final CachedTome tome => TomeListTile(tome: tome),
      _ => throw Exception('Unexpected type'),
    },
    itemCount: entries.length,
  );
}
