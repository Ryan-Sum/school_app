import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_app/screens/account_screen.dart';
import 'package:school_app/screens/calendar.dart';
import 'package:school_app/screens/home.dart';
import 'package:school_app/screens/menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    Home(),
    CalendarScreen(),
    MenuScreen(),
    AccountScreen(),
  ];
  void _onItemTapped(int index) {
    HapticFeedback.selectionClick();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            activeIcon: Icon(Icons.fastfood),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        enableFeedback: true,
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color.fromARGB(255, 20, 33, 61),
        selectedItemColor: const Color.fromARGB(255, 252, 163, 17),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
