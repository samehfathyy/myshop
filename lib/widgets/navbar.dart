import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Navbar extends StatefulWidget {
  Navbar({super.key, required this.onItemTapped});
  final Function(int) onItemTapped;

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int screenindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      //padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: Colors.black.withOpacity(0.9),
      ),
      clipBehavior: Clip.hardEdge,
      child: GNav(
        tabs: [
          GButton(
            icon: screenindex == 0 ? Icons.home : Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: screenindex == 1 ? Icons.favorite : Icons.favorite_border,
            text: 'Likes',
          ),
          GButton(
            icon: screenindex == 2
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined,
            text: 'Search',
          ),
          GButton(
            icon: screenindex == 3 ? Icons.person_2 : Icons.person_2_outlined,
            text: 'Profile',
          )
        ],
        onTabChange: (value) {
          widget.onItemTapped(value);
          screenindex = value;
          setState(() {});
        },
        haptic: true, // haptic feedback
        gap: 8, // gap between icon and text
        iconSize: 24, // tab button icon size
        activeColor: Colors.black,
        color: Colors.white,
        backgroundColor: Colors.transparent,
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        tabBackgroundColor: Colors.white, // selected tab background color
        tabMargin: EdgeInsets.all(3),
        padding: EdgeInsets.symmetric(
            horizontal: 15, vertical: 12), // navigation bar padding
      ),
    );
  }
}
