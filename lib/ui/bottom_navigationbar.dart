import 'package:first_sell/ui/navigation_pages/fevorite.dart';
import 'package:first_sell/ui/navigation_pages/homeScreen.dart';
import 'package:first_sell/ui/navigation_pages/profile.dart';
import 'package:flutter/material.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  final pages = [
    const HomeScreen(),
    const FevoriteScreen(),
    const Card(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.yellow,
        selectedLabelStyle:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              tooltip: 'Home',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              tooltip: 'Favorite',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              tooltip: 'Card',
              backgroundColor: Colors.grey),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              tooltip: 'Profile',
              backgroundColor: Colors.grey),
        ],
      ),
    );
  }
}
