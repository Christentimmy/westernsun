import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:westernsun/screens/alt_home_screen.dart';
import 'package:westernsun/screens/favorite_screen.dart';
import 'package:westernsun/screens/my_orders_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final RxInt _currentIndex = 0.obs;

  final List _pages = [
    const AltHomeScreen(),
    MyOrdersScreen(),
    FavoriteScreen(),
    Container(color: Colors.tealAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // color: const Color(0xff161F2C),
            color: Colors.brown,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: GNav(
              duration: const Duration(milliseconds: 150),
              textStyle: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              selectedIndex: _currentIndex.value,
              activeColor: Colors.white,
              onTabChange: (value) {
                _currentIndex.value = value;
              },
              tabBackgroundColor: const Color.fromARGB(255, 61, 27, 15),
              color: Colors.white,
              backgroundColor: Colors.brown,
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.confirmation_number, text: "Bookings"),
                GButton(icon: Icons.favorite, text: "Favorite"),
                GButton(icon: Icons.account_circle, text: "Account"),
              ],
              padding: const EdgeInsets.all(10.0),
            ),
          ),
        ),
      ),
      body: Obx(() => _pages[_currentIndex.value]),
    );
  }
}
