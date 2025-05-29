import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_state.dart';

class SignUpScreen extends ConsumerWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text('¡Registro exitoso!'),
                content: const Text('Tu cuenta ha sido creada correctamente.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.go('/home');

                      ref
                          .read(authNotifierProvider.notifier)
                          .resetStatus(); // Reset
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
        );
      } else if (next.isFail) {
        showDialog(
          context: context,
          builder:
              (_) => AlertDialog(
                title: const Text('¡Registro fallido!'),
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
          appBar: AppBar(centerTitle: true, title: Text('Sign Up')),
          body: Container(
            color: Colors.amber[100],
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Flutter App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(hintText: 'Enter the username'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'Enter the email'),
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
                              .signUp(
                                _usernameController.text,
                                _passwordController.text,
                                _emailController.text,
                              ),
                      child: Text('Sing Up'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
        : CircularProgressIndicator();
  }
}
