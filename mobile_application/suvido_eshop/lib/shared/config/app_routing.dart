import 'package:go_router/go_router.dart';
import 'package:suvido_eshop/presentation/_app_presentation_exporter.dart';

class AppRouting {
  static final GoRouter appRoutes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
    ],
  );
}
