import 'package:bsr/app/router/router.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

const routeParamTomeId = 'tomeId';

enum AppRoute {
  libraryTomes(
    '/library_tomes',
    saveLocation: true,
  ),

  libraryAuthors(
    '/library_authors',
    saveLocation: true,
  ),

  libraryCollections(
    '/library_collections',
    saveLocation: true,
  ),

  reader(
    'reader/:$routeParamTomeId',
    saveLocation: true,
  ),

  settings(
    'settings',
  );

  const AppRoute(
    this.path, {
    this.saveLocation = false,
  });

  final String path;
  final bool saveLocation;

  static AppRoute get defaultRoute => AppRoute.libraryAuthors;

  static AppRoute? getByPath(String path) {
    return AppRoute.values.firstWhereOrNull(
      (e) => e.path == path,
    );
  }
}

extension NavigationHelper on WidgetRef {
  /// Navigate to a location above current.
  /// Instead of:
  /// ```
  /// onPressed: () => context.go(
  ///   '${AppRoute.onboarding.path}/${AppRoute.multiuse.path}',
  /// ),
  /// ```
  ///
  /// USE:
  /// ```
  /// onPressed: () => context.goFurther(AppRoute.multiuse.path),
  /// ```
  void goFurther(
    AppRoute appRoute, {
    bool preserveQueryParams = false,
    Map<String, dynamic> queryParameters = const {},
    Map<String, String> pathParameters = const <String, String>{},
  }) {
    if (!context.mounted) return;

    final routerPersistenceState =
        read(routerPersistenceProvider.notifier).getCachedState();

    final path = '${routerPersistenceState.fullPath}/${appRoute.path}';

    final oldUrl = Uri.parse(routerPersistenceState.fullPath);
    final oldQueryParameters =
        preserveQueryParams ? oldUrl.queryParameters : null;
    final newQueryParameters = {...?oldQueryParameters, ...queryParameters};

    final encodedParams = <String, String>{
      for (final MapEntry<String, String> param in pathParameters.entries)
        param.key: Uri.encodeComponent(param.value),
    };
    final location = _patternToPath(path, encodedParams);

    final resultLocation = Uri(
      path: location,
      queryParameters: newQueryParameters.isEmpty ? null : newQueryParameters,
    ).toString();

    return GoRouter.of(context).go(resultLocation);
  }

  /// Reconstructs the full path from a [pattern] and path parameters.
  ///
  /// This is useful for restoring the original path from a [RegExpMatch].
  /// This thing is directly copied from the go_router package ¯\_(ツ)_/¯
  String _patternToPath(String pattern, Map<String, String> pathParameters) {
    final buffer = StringBuffer();
    var start = 0;
    for (final match in _parameterRegExp.allMatches(pattern)) {
      if (match.start > start) {
        buffer.write(pattern.substring(start, match.start));
      }
      final name = match[1]!;
      buffer.write(pathParameters[name]);
      start = match.end;
    }

    if (start < pattern.length) {
      buffer.write(pattern.substring(start));
    }
    return buffer.toString();
  }
}

final RegExp _parameterRegExp = RegExp(r':(\w+)(\((?:\\.|[^\\()])+\))?');
