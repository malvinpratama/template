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
      GoRoute(
        name: IntroPage.route,
        path: IntroPage.route,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        name: LoginPage.route,
        path: LoginPage.route,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: HomePage.route,
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
