import 'package:flutter/material.dart';

import 'package:waddle_app/src/common/app_sizes.dart';
import 'package:waddle_app/src/theme/light_theme.dart';
import 'package:waddle_app/src/features/add/add_screen.dart';
import 'package:waddle_app/src/features/home/home_screen.dart';
import 'package:waddle_app/src/features/profile/profile_screen.dart';

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({super.key});

  @override
  State<ScaffoldWithNavBar> createState() => _ScaffoldWithNavBarState();
}

class _ScaffoldWithNavBarState extends State<ScaffoldWithNavBar> {
  int _currentIndex = 0;

  void _onTap(int index) => setState(() => _currentIndex = index);

  final List<Widget> _screens = const [
    HomeScreen(),
    AddScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    const r = Radius.circular(50);
    const boxDecoration = BoxDecoration(
      // TODO: implement dark color
      color: lightBottomNavColor,
      borderRadius: BorderRadius.only(topLeft: r, topRight: r),
    );

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: boxDecoration,
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: BottomNavigationBar(
          onTap: _onTap,
          currentIndex: _currentIndex,
          items: _buildNavigationItems(),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    return const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline), label: 'Add'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ];
  }
}
