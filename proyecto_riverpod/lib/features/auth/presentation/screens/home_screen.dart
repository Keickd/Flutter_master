import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/widgets/custom_bottom_navigation_bar.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/widgets/end_drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      drawerEnableOpenDragGesture: true,
      endDrawer: EndDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Center(child: Text('hola')),
    );
  }
}
