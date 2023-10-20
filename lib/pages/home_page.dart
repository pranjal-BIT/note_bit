import 'package:flutter/material.dart';
import 'package:note_bit/components/bottom_nav_bar.dart';
import 'package:note_bit/const.dart';
import 'package:note_bit/pages/about_page.dart';
import 'package:note_bit/pages/papers_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    PapersPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constbackgroundColor,
      appBar: AppBar(
        title: Text(
          "NoteBit",
          style: TextStyle(
              color: Colors.black, fontFamily: 'outfit', fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: constbackgroundColor,
        elevation: 1,
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: pages[_selectedIndex],
    );
  }
}
