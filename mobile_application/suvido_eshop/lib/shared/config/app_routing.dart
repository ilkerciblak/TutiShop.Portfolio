import 'package:go_router/go_router.dart';
import 'package:suvido_eshop/presentation/_app_presentation_exporter.dart';
import 'package:suvido_eshop/presentation/home/home_navigation_screen.dart';

class AppRouting {
  static final GoRouter appRoutes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeNavigationScreen(),
      )
    ],
  );
}
