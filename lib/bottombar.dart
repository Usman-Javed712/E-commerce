import 'package:ecommerce/favpage.dart';
import 'package:ecommerce/homepage.dart';
import 'package:ecommerce/profile.dart';
import 'package:ecommerce/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int myCurrentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    SearchPage(),
    FavPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[myCurrentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: GNav(
              selectedIndex: myCurrentIndex,
              onTabChange: (index) {
                setState(() {
                  myCurrentIndex = index;
                });
              },
              backgroundColor: Colors.transparent,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Color(0xFF19C463),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                ),
                GButton(
                  icon: Icons.search,
                ),
                GButton(
                  icon: Icons.favorite_outline,
                ),
                GButton(
                  icon: Icons.person_3_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
