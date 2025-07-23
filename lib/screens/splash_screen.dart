import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/screens/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateBasedOnAuth();
  }

  void _navigateBasedOnAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ✅ User is logged in
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => const MainPage()),
      // );

      Navigator.pushReplacementNamed(context, '/main');
    } else {
      // 🔐 User not logged in
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (_) => const LoginPage()),
      // );

      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App name
            Text(
              'FOODGO',
              style: GoogleFonts.playfairDisplay(
                fontSize: 56,
                color: Colors.white,
                letterSpacing: 4,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Tagline
            Text(
              'Don’t stand in line. Sit and dine.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.white70,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
