import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:suvido_eshop/modules/user/presentation/login/login_screen.dart';
import 'package:suvido_eshop/presentation/_app_presentation_exporter.dart';
import 'package:suvido_eshop/presentation/home/home_navigation_screen.dart';
import 'package:suvido_eshop/shared/services/shared_prefences.dart';

class AppRouting {
  static final GoRouter appRoutes = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        redirect: (context, state) {
          if (GetIt.instance<SharedPrefencesService>().getBool('knownUser') ??
              false) {
            return '/login';
          }
          return null;
        },
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeNavigationScreen(),
      )
    ],
  );
}
