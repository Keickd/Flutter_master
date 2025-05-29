import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/auth/application/auth_provider.dart';

class LoginView extends ConsumerStatefulWidget {
  @override
  ConsumerState<LoginView> createState() => _LoginView();
}

class _LoginView extends ConsumerState<LoginView> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: Container(
        color: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User'),
              TextField(
                controller: TextEditingController(text: user.user.username),
                onChanged:
                    (value) => ref
                        .read(authProvider.notifier)
                        .onChangedUsernameTextField(value),
              ),
              const SizedBox(height: 15),
              Text('Password'),
              TextField(
                controller: TextEditingController(text: user.user.password),
                onChanged:
                    (value) => ref
                        .read(authProvider.notifier)
                        .onChangedPassTextField(value),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => ref.read(authProvider.notifier).login(),
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
