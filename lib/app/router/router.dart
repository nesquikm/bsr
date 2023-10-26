import 'package:bsr/app/router/router_persistence/router_persistence.dart';
import 'package:bsr/app/router/routes/routes.dart';
import 'package:bsr/features/library/page/page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

export 'router_persistence/router_persistence.dart';
export 'routes/routes.dart';

GoRouter getRouter(RouterPersistence routerPersistence) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  // Create a new router
  final router = GoRouter(
    restorationScopeId: 'app',
    navigatorKey: rootNavigatorKey,
    initialLocation: routerPersistence.getCachedState().fullPath,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => LibraryPage(
          navigationShell: navigationShell,
        ),
        branches: [
          libraryTomesBranch,
          libraryAuthorsBranch,
          libraryCollectionsBranch,
        ],
      ),
    ],
    debugLogDiagnostics: true,
  );

  router.routerDelegate.addListener(() {
    final route =
        router.routerDelegate.currentConfiguration.last.route is GoRoute
            ? router.routerDelegate.currentConfiguration.last.route as GoRoute
            : null;

    final saveLocation = route != null &&
        (AppRoute.getByPath(route.path)?.saveLocation ?? false);

    if (saveLocation) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        routerPersistence.setState(
          RouterPersistenceState(
            fullPath:
                router.routerDelegate.currentConfiguration.last.matchedLocation,
          ),
        );
      });
    }
  });

  return router;
}
