import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_state.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        context.go('/home_selector');
        ref.read(authNotifierProvider.notifier).resetStatus();
      } else if (next.isFail) {
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text('Login fallido'),
                content: const Text('Ha habido un problema!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();

                      ref
                          .read(authNotifierProvider.notifier)
                          .resetStatus(); // Reset
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      }
    });

    return !ref.watch(authNotifierProvider).isLoading
        ? Scaffold(
          appBar: AppBar(centerTitle: true, title: Text('Login')),
          body: Container(
            color: Colors.amber[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome back to Flutter App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(hintText: 'Enter the username'),
                  ),

                  const SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: 'Enter the password'),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          () => ref
                              .read(authNotifierProvider.notifier)
                              .login(
                                _usernameController.text,
                                _passwordController.text,
                              ),
                      child: Text('Login'),
                    ),
                  ),
                  const SizedBox(height: 2),
                  TextButton(
                    onPressed: () => context.push('/signUp'),
                    child: Text('Are you not registered? Sign Up!'),
                  ),
                ],
              ),
            ),
          ),
        )
        : CircularProgressIndicator();
  }
}
