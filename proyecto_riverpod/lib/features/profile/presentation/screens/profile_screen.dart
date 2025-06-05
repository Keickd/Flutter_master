import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_provider.dart';
import 'package:proyecto_riverpod/features/profile/presentation/providers/profile_provider.dart';
import 'package:proyecto_riverpod/features/profile/presentation/providers/profile_state.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController passController;
  late final TextEditingController emailController;

  bool initialized = false;

  @override
  void initState() {
    super.initState();

    usernameController = TextEditingController();
    passController = TextEditingController();
    emailController = TextEditingController();

    // Espera a que el widget esté montado antes de modificar providers
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final username = ref.read(authNotifierProvider).user.username;
      await ref.read(profileNotifierProvider.notifier).getUser(username);

      final user = ref.read(profileNotifierProvider).user;
      usernameController.text = user.username;
      passController.text = user.password;
      emailController.text = user.email;

      // Actualizamos estado local para forzar build
      setState(() {
        initialized = true;
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    ref.listen<ProfileState>(profileNotifierProvider, (previous, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Data saved'),
            duration: Duration(seconds: 2),
          ),
        );

        ref.read(profileNotifierProvider.notifier).resetStatus();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Profile'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            color: Colors.amber[100],
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Username', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  TextField(controller: usernameController),
                  const SizedBox(height: 15),

                  const Text('Password', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  TextField(controller: passController, obscureText: true),
                  const SizedBox(height: 15),

                  const Text('Email', style: TextStyle(fontSize: 20)),
                  const SizedBox(height: 5),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final notifier = ref.read(
                          profileNotifierProvider.notifier,
                        );
                        await notifier.updateUserData(
                          usernameController.text,
                          passController.text,
                          emailController.text,
                        );
                      },
                      child: const Text('Save data'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
