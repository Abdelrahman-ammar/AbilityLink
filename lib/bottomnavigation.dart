import 'package:flutter/material.dart';
import 'package:ability_link1/home_page.dart';

import 'package:ability_link1/add.dart';
import 'package:ability_link1/upcoming_event.dart';
import 'package:ability_link1/inbox.dart';
import 'package:ability_link1/profilepage.dart';

//import 'package:graduate_project/utli/task_par.dart';
//import 'package:flutter/src/rendering/box.dart';

class Bottom_navy extends StatefulWidget {
  Bottom_navy() : super(key: GlobalKey());

  @override
  State<Bottom_navy> createState() => _bottomnavy();
}

class _bottomnavy extends State<Bottom_navy> {
  int _selectedIndex = 0;
  final List<Widget> _widgetoptions = <Widget>[
    Home_Page(),
    Upcoming_Event(),
    add_page(),
    inbox_page(
      dp: 'dp',
      name: 'name',
      time: 'time',
      msg: 'msg',
      isOnline: true,
      counter: 5,
    ),
    person(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => const Home_Page(),
        '/event': (context) => Upcoming_Event(),
        '/add': (context) => add_page(),
        '/inbox': (context) => inbox_page(
              dp: 'dp',
              name: 'name',
              time: 'time',
              msg: 'msg',
              counter: 5,
              isOnline: true,
            ),
        '/person': (context) => person()
      },
      home: Scaffold(
        extendBody: true,
        body: _widgetoptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: BottomNavigationBar(
              unselectedItemColor: const Color.fromARGB(255, 112, 112, 112),
              // showUnselectedLabels: true,
              unselectedIconTheme: IconThemeData(
                color: const Color.fromARGB(255, 112, 112, 112),
              ),
              iconSize: 30,
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              selectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              selectedItemColor: Colors.blue,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.calendar_month,
                  ),
                  label: 'Events',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                  ),
                  label: 'Add Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.inbox_outlined,
                  ),
                  label: 'Inbox',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_3_outlined,
                  ),
                  label: 'Profile',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
