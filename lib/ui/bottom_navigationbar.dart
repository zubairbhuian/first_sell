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
    return  Scaffold(
bottomNavigationBar: BottomNavigationBar(
  items: [],
),
    );
  }
}
