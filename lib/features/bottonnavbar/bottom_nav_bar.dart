import 'package:ctfinfo/features/event/screens/event_screen.dart';
import 'package:ctfinfo/features/resources/screens/resources_screen.dart';
import 'package:ctfinfo/features/teams/screens/team_list_screen.dart';
import 'package:ctfinfo/features/teams/screens/your_team_screen.dart';
import 'package:ctfinfo/style/pallet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "/bottom-nav-bar";
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static final List<Widget> _navBarScreens = <Widget>[
    EventScreen(),
    TeamListScreen(),
    ResourcesScreen(),
    YourTeamScreen(),
  ];

  void _onMenuItemSelected(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navBarScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Pallet.blackColour,
        elevation: 10,
        type: BottomNavigationBarType.fixed, 
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.flag,
              color: Pallet.greenColour,
            ),
            activeIcon: Icon(
              CupertinoIcons.flag_fill,
              color: Pallet.greenColour,
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2,
            color: Pallet.greenColour,
            ),
            activeIcon: Icon(
              CupertinoIcons.person_2_fill,
              color: Pallet.greenColour,
            ),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_text,
            color: Pallet.greenColour,),
            activeIcon: Icon(
              CupertinoIcons.doc_text_fill,
              color: Pallet.greenColour,
            ),
            label: 'Write Ups',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person,
            color: Pallet.greenColour,),
            activeIcon: Icon(
              CupertinoIcons.person_solid,
              color: Pallet.greenColour,
            ),
            label: 'Your Team',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Pallet.greenColour,
        onTap: _onMenuItemSelected,
      ),
    );
  }
}
