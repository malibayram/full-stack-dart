import 'package:go_router/go_router.dart';

import '../models/user.dart';
import '../pages/index.dart';

GoRouter routes(User? user) {
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (_, __) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (_, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (_, __) {
          return const ProfilePage();
        },
      ),
    ],
    redirect: (context, state) {
      if (state.location != '/login' && user == null) {
        return '/login';
      }
      return null;
    },
  );
}
