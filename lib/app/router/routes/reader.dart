import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/reader/reader.dart';
import 'package:go_router/go_router.dart';

GoRoute get readerRoute => GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: AppRoute.reader.path,
      builder: (context, state) => const ReaderPage(),
    );
