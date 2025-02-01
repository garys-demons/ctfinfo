import 'package:ctfinfo/features/event/screens/event_screen.dart';
import 'package:ctfinfo/features/teams/screens/team_list_screen.dart';
import 'package:ctfinfo/features/teams/screens/teamid_input_screen.dart';
import 'package:ctfinfo/features/teams/screens/your_team_screen.dart';
import 'package:ctfinfo/utils/shared_preferences.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String id = "/bottom-nav-bar";
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static bool isTeamIdSaved = SharedPreferencesDemo.isTeamIdSaved();
  Widget teamWidget = isTeamIdSaved ? YourTeamScreen() : TeamidInputScreen();
  int _selectedIndex = 0;
  static const List<Widget> _navBarScreens = <Widget>[
    EventScreen(),
    TeamListScreen(),
    Center(
        child: Text("Write Ups (Coming Soon)", style: TextStyle(fontSize: 30))),
    YourTeamScreen(),
  ];

  void _onMenuItemSelected(int index) async {
    // if (index == 3){
    //   bool isTeamIdSaved = SharedPreferencesDemo.isTeamIdSaved();
    //   if (!isTeamIdSaved){
    //     Navigator.pushNamed(
    //       context, 
    //       TeamidInputScreen.id,
    //       );
    //   return;
    //   }
    // } 

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
