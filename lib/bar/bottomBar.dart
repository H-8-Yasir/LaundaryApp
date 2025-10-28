import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:laundaryapp/Screens/homescreen.dart';
import 'package:laundaryapp/Screens/virtualAssistant.dart';
import 'package:laundaryapp/Screens/washtypescreen.dart';

class BottomBar extends StatefulWidget{
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index = 0;

  final List<Widget> pages=[
    HomeScreen(),
    Washtypescreen(),
    HomeScreen(),
    Virtualassistant(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xFFD4AF37),
        buttonBackgroundColor: Colors.black,
        backgroundColor: Color(0xFFF7F3EE),
        animationCurve: Curves.easeInOut,
       // animationDuration: const Duration(milliseconds: 400),
        onTap: (index){
          setState(() => _index=index);
        },
        items: [
          Icon(Icons.home,color: Colors.white),
          Icon(Icons.explore,color: Colors.white),
          Icon(Icons.add,color: Colors.white),
          Icon(Icons.support_agent,color: Colors.white),
          Icon(Icons.person,color: Colors.white)
        ],
      ),
    );
  }
}