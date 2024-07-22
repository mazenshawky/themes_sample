import 'package:flutter/material.dart';
import 'package:themes_sample/screens/home_screen.dart';
import 'package:themes_sample/screens/profile_screen.dart';
import 'package:themes_sample/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = const [
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Profile',
    'Settings',
  ];

  var _title = 'Home';
  var _currentIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home_outlined), label: titles[0]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person), label: titles[1]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: titles[2]),
        ],
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}
