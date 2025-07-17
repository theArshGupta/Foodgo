import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String query;
  const SearchPage({super.key,required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: Center(
        child: Text(
          'You searched for: $query',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
