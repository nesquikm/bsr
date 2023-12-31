import 'package:collection/collection.dart';

final _whitespacesRegex = RegExp(r'[^\s]*\s*');

Set<String> getWordsFromString(String text) {
  return Set.from(
    _whitespacesRegex
        .allMatches(text)
        .map((e) => e[0] ?? '')
        .map(
          (word) => word.trim().toLowerCase(),
        )
        .where((word) => word.isNotEmpty),
  );
}

Set<String> filterSearchIndex(
  Map<String, Set<String>> searchIndex,
  String searchText,
) {
  final searchWords = getWordsFromString(searchText);

  if (searchWords.isEmpty) {
    return Set.from(searchIndex.values.flattened);
  }

  return searchWords.foldIndexed(
    <String>{},
    (index, previousValue, searchWord) {
      final subResult = searchIndex.entries
          .where(
        (index) => index.key.contains(searchWord),
      )
          .fold(
        <String>{},
        (previousValue, element) => {
          ...previousValue,
          ...element.value,
        },
      );

      return index == 0
          ? subResult
          : previousValue.intersection(
              subResult,
            );
    },
  );
}
