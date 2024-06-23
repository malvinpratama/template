import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../features/pages.dart';
import '../services/services.dart';

class AppRoutes {
  static final GoRouter _router = GoRouter(
    initialLocation: SplashscreenPage.route,
    observers: [TalkerRouteObserver(LoggerService.talker)],
    routes: [
      GoRoute(
        name: SplashscreenPage.route,
        path: SplashscreenPage.route,
        builder: (context, state) => const SplashscreenPage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
