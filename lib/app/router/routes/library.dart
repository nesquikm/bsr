import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/library/library.dart';
import 'package:go_router/go_router.dart';

StatefulShellBranch get libraryAuthorsBranch {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        name: AppRoute.libraryAuthors.name,
        path: AppRoute.libraryAuthors.path,
        builder: (context, state) => const LibraryAuthorsPage(),
        routes: [
          readerRoute,
          settingsRoute,
        ],
      ),
    ],
  );
}

StatefulShellBranch get libraryTomesBranch {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        name: AppRoute.libraryTomes.name,
        path: AppRoute.libraryTomes.path,
        builder: (context, state) => const LibraryTomesPage(),
        routes: [
          readerRoute,
          settingsRoute,
        ],
      ),
    ],
  );
}

StatefulShellBranch get libraryCollectionsBranch {
  return StatefulShellBranch(
    routes: [
      GoRoute(
        name: AppRoute.libraryCollections.name,
        path: AppRoute.libraryCollections.path,
        builder: (context, state) => const LibraryCollectionsPage(),
        routes: [
          readerRoute,
          settingsRoute,
        ],
      ),
    ],
  );
}
