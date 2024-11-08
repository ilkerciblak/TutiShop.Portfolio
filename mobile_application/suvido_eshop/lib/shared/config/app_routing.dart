import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:suvido_eshop/modules/catalog/presentation/_catalog_presentation_exporter.dart';
import 'package:suvido_eshop/presentation/_app_presentation_exporter.dart';
import 'package:suvido_eshop/shared/_project_shared_exporter.dart';
import 'package:suvido_eshop/shared/enums/authentication_status.dart';

class AppRouting {
  static final GoRouter appRoutes = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      switch (GetIt.instance<Authentication>().authenticationStatus) {
        case AuthenticationStatus.authenticated:
          return null;

        default:
          return '/login';
      }
    },
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
      ),
      GoRoute(
        path: '/products/:id',
        name: 'product-detail',
        builder: (context, state) => ProductDetailScreen(
          productId: int.parse(state.pathParameters['id']!),
        ),
      )
    ],
  );
}
