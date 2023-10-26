import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/settings/settings.dart';
import 'package:go_router/go_router.dart';

GoRoute get settingsRoute => GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: AppRoute.settings.path,
      builder: (context, state) => const SettingsPage(),
    );
