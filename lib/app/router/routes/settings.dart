import 'package:bsr/app/global_keys.dart';
import 'package:bsr/app/router/router.dart';
import 'package:bsr/features/settings/settings.dart';
import 'package:go_router/go_router.dart';

GoRoute get settingsRoute => GoRoute(
      parentNavigatorKey: GlobalKeys.rootNavigatorKey,
      path: AppRoute.settings.path,
      builder: (context, state) => const SettingsPage(),
    );
