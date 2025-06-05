import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.amber[200]),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          ListTile(
            title: Text('Profile'),
            leading: const Icon(Icons.person),
            onTap: () => context.push('/profile'),
          ),

          ListTile(
            title: Text('Settings'),
            leading: const Icon(Icons.settings),
          ),

          ListTile(title: Text('Functions'), leading: const Icon(Icons.task)),

          ListTile(
            title: Text('Support'),
            leading: const Icon(Icons.support_agent),
          ),
        ],
      ),
    );
  }
}
