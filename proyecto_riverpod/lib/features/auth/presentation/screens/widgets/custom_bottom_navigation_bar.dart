import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 1,
      iconSize: 30,
      selectedFontSize: 20,
      unselectedFontSize: 15,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
