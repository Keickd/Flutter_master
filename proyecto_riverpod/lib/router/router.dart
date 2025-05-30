import 'package:go_router/go_router.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/home_screen.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/login_screen.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/sign_up_screen.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/signUp', builder: (context, state) => SignUpScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
  ],
);
