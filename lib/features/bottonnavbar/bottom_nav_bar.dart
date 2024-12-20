import 'package:ctfinfo/features/event/event_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "/bottom-nav-bar";
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _navBarScreens = <Widget>[
    EventScreen(),
    Center(child: Text("Team", style: TextStyle(fontSize: 30))),
    Center(child: Text("Write Ups", style: TextStyle(fontSize: 30))),
    Center(child: Text("Your Team", style: TextStyle(fontSize: 30))),
  ];

  void _onMenuItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navBarScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Write Ups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Your Team',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onMenuItemSelected,
      ),
    );
  }
}
