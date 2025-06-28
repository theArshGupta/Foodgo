import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart_screen.dart'; // ⬅️ Make sure this path is correct
import 'package:food_delivery/screens/profile_screen.dart';

// You can also create profile_screen.dart and orders_screen.dart for future use

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // Screens for each bottom nav item
  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(), // ✅ Your real cart screen
    const ProfileScreen(),
// Placeholder for profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
