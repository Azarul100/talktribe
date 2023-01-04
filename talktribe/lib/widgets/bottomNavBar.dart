import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talktribe/pages/group_page.dart';
import 'package:talktribe/pages/profile_page.dart';
import 'package:talktribe/pages/welcome_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.man),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
      currentIndex: _index,
      selectedItemColor: Colors.white,
      onTap: (index) {
        if (index == 0 && _index != 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GroupPage()));
        }
        if (index == 1 && _index != 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ProfilePage()));
        }
        if (index == 2 && _index != 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => WelcomePage()));
        }
        _index = index;
      },
      backgroundColor: Colors.red,
    );
    ;
  }
}
