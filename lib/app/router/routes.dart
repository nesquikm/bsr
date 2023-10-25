import 'package:collection/collection.dart';
import 'package:logging/logging.dart';

enum AppRoute {
  library(
    'library',
    '/library',
    isSaveLocation: true,
  ),

  reader(
    'reader',
    '/reader',
    isSaveLocation: true,
  ),

  settings(
    'settings',
    '/settings',
  );

  const AppRoute(
    this.name,
    this.path, {
    this.isSaveLocation = false,
  });

  final String name;
  final String path;
  final bool isSaveLocation;

  static AppRoute get defaultRoute => library;
  static final _log = Logger('AppRoute');

  static AppRoute? getByPath(String path) {
    return AppRoute.values.firstWhereOrNull(
      (e) => e.path == path,
    );
  }

  /// Returns path segments from [fullPath]. It's a wrapper for
  /// [Uri.pathSegments], but for the first segment adds slash.
  /// Also it filters and joins segments that contains parameters.
  /// We are strongly recommend to use this method instead
  /// of [Uri.pathSegments].
  static List<String> pathSegments({required String fullPath}) {
    final uri = Uri.parse(fullPath);
    if (uri.pathSegments.isEmpty) return [];

    final segments = [...uri.pathSegments]
      ..replaceRange(0, 1, ['/${uri.pathSegments.first}']);

    final filteredSegments =
        segments.fold(<String>[], (previousValue, element) {
      if (element.startsWith(':')) {
        if (previousValue.isEmpty) {
          // Don't know what to do with this case
          return [element];
        }
        final [...rest, last] = previousValue;

        return [...rest, '$last/$element'];
      }

      return [...previousValue, element];
    });

    return filteredSegments
        .where((segment) => AppRoute.getByPath(segment) != null)
        .toList();
  }
}

/// Get first segment from [fullPath].
String getRootPath({required String fullPath}) {
  final segments = AppRoute.pathSegments(fullPath: fullPath);
  if (segments.isEmpty) {
    AppRoute._log.severe('getRootPath: no root location found');

    return AppRoute.defaultRoute.path;
  }

  return segments.first;
}

/// Get last segment from [fullPath].
String getCurrentPath({required String? fullPath}) {
  if (fullPath == null) {
    return AppRoute.defaultRoute.path;
  }

  final segments = AppRoute.pathSegments(fullPath: fullPath);
  if (segments.isEmpty) {
    AppRoute._log.severe('getCurrentPath: no current location found');

    return AppRoute.defaultRoute.path;
  }

  return segments.last;
}

/// Get first segment from [fullPath] and return [AppRoute].
AppRoute getRootAppRoute({required String fullPath}) {
  return AppRoute.getByPath(getRootPath(fullPath: fullPath)) ??
      AppRoute.defaultRoute;
}

/// Get last segment from [fullPath] and return [AppRoute].
AppRoute getCurrentAppRoute({required String? fullPath}) {
  return fullPath != null
      ? AppRoute.getByPath(getCurrentPath(fullPath: fullPath)) ??
          AppRoute.getByPath(fullPath) ??
          AppRoute.defaultRoute
      : AppRoute.defaultRoute;
}

/// Returns true, if every segment from [fullPath] can be saved in
/// NavigationService.
bool canSaveLocation({required String fullPath}) {
  return AppRoute.pathSegments(fullPath: fullPath)
      .every((segment) => AppRoute.getByPath(segment)?.isSaveLocation ?? false);
}
