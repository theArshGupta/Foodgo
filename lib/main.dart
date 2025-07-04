import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/checkout_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/main_page.dart';
import 'providers/cart_providers.dart';
import 'providers/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FoodGo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      themeMode: themeProvider.currentTheme, // 👈 Connect theme mode
      home: const SplashScreen(),
      routes: {
        '/main': (context) => const MainPage(),
        '/cart': (context) => const CartScreen(),
        '/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}
