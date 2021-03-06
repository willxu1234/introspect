import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      // leading: Icon(Icons.menu),
      title: Text("Introspect", style: GoogleFonts.lora()),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  static final List<String> routes = ['/', '/graph', '/calendar', '/search'];

  final int routeIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({this.routeIndex = 0, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outlined), label: 'Legend'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined), label: 'Search'),
      ],
      currentIndex: routeIndex,
      onTap: onTap,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        child: Text('Introspect'),
      ),
      ListTile(
        title: Text('Item 1'),
        onTap: () {},
      ),
      ListTile(
        title: Text('Item 2'),
        onTap: () {},
      )
    ]));
  }
}
