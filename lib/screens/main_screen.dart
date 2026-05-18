import 'package:flutter/material.dart';
import 'package:flutter_second/screens/home_screen.dart';
import 'package:flutter_second/screens/login_screen.dart';
import 'package:flutter_second/screens/product_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [HomeScreen(), ProductScreen(), LoginScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.amberAccent,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.blender), label: 'Product'),
          NavigationDestination(icon: Icon(Icons.blender), label: 'Profile'),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
