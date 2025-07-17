import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_providers.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String tags;
  final String rating;
  final String time;
  final String price;

  const RestaurantDetailScreen({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.rating,
    required this.time,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(name), backgroundColor: Colors.red),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 80,
            ), // padding for button space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(tags, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildInfoTile("⭐ $rating"),
                          _buildInfoTile("⏱ $time"),
                          _buildInfoTile("💰 $price"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Delicious food delivered to your doorstep. Order now!',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 🔴 Add to Cart Button
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addItem(
                  CartItem(
                    name: name,
                    imageUrl: imageUrl,
                    quantity: 1, // 🔴 This was missing
                    price: double.parse(
                      price.replaceAll(RegExp(r'[^0-9]'), ''),
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$name added to cart'),
                    backgroundColor: Colors.red,
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Add to Cart", style: TextStyle(fontSize: 16,color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }
}
