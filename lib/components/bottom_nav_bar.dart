// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:note_bit/const.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        mainAxisAlignment: MainAxisAlignment.center,
        textStyle: constFonts,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade300,
        duration: Duration(milliseconds: 250),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
            // iconColor: Colors.grey[800],
            // textColor: Colors.white,
          ),
          GButton(
            icon: Icons.info_outline,
            text: 'About',
            // iconColor: Colors.grey[800],
            // textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
