import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.blue,
                      child: Text('AM'),
                    ),
                  ],
                ),
                Text('Amit Ghimire'),
              ],
            ),
          ),
          ListTile(
            leading: Text('Setting', style: TextStyle(fontSize: 22)),
            title: Icon(Icons.settings),
          ),
          ListTile(
            leading: Text('About Us', style: TextStyle(fontSize: 22)),
            title: Icon(Icons.more_sharp),
          ),
          ListTile(
            leading: Text('Policy', style: TextStyle(fontSize: 22)),
            title: Icon(Icons.build),
          ),
          ListTile(
            leading: Text('Profile', style: TextStyle(fontSize: 22)),
            title: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
