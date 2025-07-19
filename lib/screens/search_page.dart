import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/dish.dart';
import '../widgets/resturant_cards.dart';

class SearchPage extends StatelessWidget {
  final String query;
  const SearchPage({super.key, required this.query});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search Results")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('dishes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No dishes found."));
          }

          final allDishes = snapshot.data!.docs
              .map((doc) => Dish.fromMap(doc.data() as Map<String, dynamic>))
              .toList();

          final filteredDishes = allDishes.where((dish) =>
              dish.name.toLowerCase().contains(query.toLowerCase())).toList();

          if (filteredDishes.isEmpty) {
            return Center(
              child: Text(
                'No dishes match "$query"',
                style: const TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            itemCount: filteredDishes.length,
            itemBuilder: (context, index) {
              final dish = filteredDishes[index];
              return RestaurantCard(
                imageUrl: dish.imageUrl,
                name: dish.name,
                tags: dish.tags,
                rating: dish.rating,
                time: dish.time,
                price: dish.price,
              );
            },
          );
        },
      ),
    );
  }
}
