import 'package:go_router/go_router.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/home_selector_screen.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/login_screen.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:proyecto_riverpod/features/profile/presentation/screens/profile_screen.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/signUp', builder: (context, state) => SignUpScreen()),
    GoRoute(
      path: '/home_selector',
      builder: (context, state) => HomeSelector(),
    ),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  ],
);
