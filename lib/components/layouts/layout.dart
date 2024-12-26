import 'package:aora_new/pages/create_page.dart';
import 'package:aora_new/pages/home_page.dart';
import 'package:aora_new/pages/profile_page.dart';
import 'package:aora_new/pages/saved_page.dart';
import 'package:aora_new/utils/theme.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = <Widget>[
    HomePage(),
    ProfilePage(),
    CreatePage(),
    SavedPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.hint, width: 0.3),
          ),
        ),
        padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: BottomNavigationBar(
          unselectedIconTheme: IconThemeData(color: AppColors.accent),
          iconSize: 24.0,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.accent,
          selectedItemColor: AppColors.primary,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
