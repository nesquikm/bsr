import 'package:bsr/app/global_keys.dart';
import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/reader/reader.dart';
import 'package:go_router/go_router.dart';

GoRoute get readerRoute => GoRoute(
      parentNavigatorKey: GlobalKeys.rootNavigatorKey,
      path: AppRoute.reader.path,
      builder: (context, state) => ReaderPage(
        tomeId: state.pathParameters[routeParamTomeId]!,
      ),
    );
