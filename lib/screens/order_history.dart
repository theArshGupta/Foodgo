import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order History"),
        backgroundColor: Colors.red,
      ),

      body: const Center(
        child: Text(
          "No past orders yet.",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
