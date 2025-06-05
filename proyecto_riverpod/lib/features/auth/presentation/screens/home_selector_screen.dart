import 'package:flutter/material.dart';
import 'package:proyecto_riverpod/features/auth/presentation/screens/widgets/end_drawer.dart';
import 'package:proyecto_riverpod/features/map/presentation/screens/map_screen.dart';

class HomeSelector extends StatefulWidget {
  const HomeSelector({super.key});

  @override
  State<HomeSelector> createState() => _HomeSelectorState();
}

class _HomeSelectorState extends State<HomeSelector> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [MapScreen(), ChatScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      bottomNavigationBar: BottomNavigationBar(
        elevation: 1,
        iconSize: 30,
        selectedFontSize: 20,
        unselectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: EndDrawer(),
      body: Center(child: Text('Chat aquí')),
    );
  }
}
