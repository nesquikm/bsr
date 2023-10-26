import 'package:bsr/app/router/router.dart';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    'reader',
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
  }) {
    if (!context.mounted) return;

    final routerPersistenceState =
        read(routerPersistenceProvider.notifier).getCachedState();

    var resultLocation = Uri.parse(routerPersistenceState.fullPath);
    // We have query params in old path that we should preserve, so we must
    // update it manually
    if (resultLocation.hasQuery && preserveQueryParams) {
      final newLocation = Uri.parse(appRoute.path);
      final query = <String, dynamic>{}
        ..addAll(resultLocation.queryParameters)
        ..addAll(newLocation.queryParameters);

      resultLocation = resultLocation.replace(
        path: '${resultLocation.path}/${newLocation.path}',
        queryParameters: query,
      );
    } else {
      // old location do not have query, new one may have it, we dont care
      resultLocation = resultLocation.replace(
        path: '${resultLocation.path}/${appRoute.path}',
      );
    }

    return GoRouter.of(context).go(
      Uri.decodeComponent(resultLocation.toString()),
    );
  }
}
