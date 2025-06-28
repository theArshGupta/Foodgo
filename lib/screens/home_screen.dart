import 'package:flutter/material.dart';
import '../widgets/resturant_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> restaurantData = [
      {
        "imageUrl":
            'https://cdn.pixabay.com/photo/2017/08/06/06/42/pizza-2589569_1280.jpg',
        "name": "Pizza Hut - Connaught Place",
        "tags": "Pizza, Fast Food · Connaught Place",
        "rating": "4.2",
        "time": "30 mins",
        "price": "₹600 for two",
      },
      {
        "imageUrl":
            "https://cdn.pixabay.com/photo/2016/03/05/19/02/hamburger-1238246_960_720.jpg",
        "name": "Burger King - Saket",
        "tags": "Burgers, American · Saket",
        "rating": "4.0",
        "time": "25 mins",
        "price": "₹500 for two",
      },
      {
        "imageUrl":
            'https://cdn.pixabay.com/photo/2022/03/02/12/40/dish-7043064_1280.jpg',
        "name": "Biryani Blues - Noida",
        "tags": "Biryani, Mughlai · Sector 18",
        "rating": "4.4",
        "time": "35 mins",
        "price": "₹700 for two",
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          // makes screen scrollable
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Top Row: Location on left, profile on right
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 4),
                        Text(
                          "Delhi,India",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://static.wikia.nocookie.net/marvelcentral/images/9/97/Tony-Stark.jpg/revision/latest?cb=20130429010603',
                       ),
                      radius: 16,
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // 🔹 Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search for restaurants, dishes...",
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // 🔹 Category Row (Delivery, Dining Out, Offers)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryButton(Icons.delivery_dining, "Delivery"),
                    _buildCategoryButton(Icons.dining, "Dining Out"),
                    _buildCategoryButton(Icons.local_offer, "Offers"),
                  ],
                ),

                const SizedBox(
                  height: 24,
                ), // spacing for future restaurant cards
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: restaurantData.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurantData[index];
                    return RestaurantCard(
                      imageUrl: restaurant["imageUrl"]!,
                      name: restaurant["name"]!,
                      tags: restaurant["tags"]!,
                      rating: restaurant["rating"]!,
                      time: restaurant["time"]!,
                      price: restaurant["price"]!,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red[50],
          child: Icon(icon, color: Colors.red),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
