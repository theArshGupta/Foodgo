import 'package:flutter/material.dart' hide SearchBar;
import '../widgets/resturant_cards.dart';
import 'package:food_delivery/widgets/search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/dish.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, String>> restaurantData = [
    //   {
    //     "imageUrl": "https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_1280.jpg",
    //     "name": "Pizza - Onion & Capsicum",
    //     "tags": "Pizza, Fast Food",
    //     "rating": "4.2",
    //     "time": "30 mins",
    //     "price": "₹400",
    //   },
    //   {
    //     "imageUrl": "https://plus.unsplash.com/premium_photo-1684534125661-614f59f16f2e?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YnVyZ2Vyc3xlbnwwfHwwfHx8MA%3D%3D",
    //     "name": "Aloo Tikki Burger",
    //     "tags": "Burgers, American",
    //     "rating": "4.0",
    //     "time": "25 mins",
    //     "price": "₹150",
    //   },
    //   {
    //     "imageUrl": "https://c.ndtvimg.com/2022-04/fq5cs53_biryani-doubletree-by-hilton_625x300_12_April_22.jpg",
    //     "name": "Hyderabadi Biryani",
    //     "tags": "Biryani, Mughlai",
    //     "rating": "4.4",
    //     "time": "35 mins",
    //     "price": "₹350",
    //   },
    //   {
    //     "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLzKnjoHmQQ4n3GDUIRQYEIGgsz8CoIXkR2heDcO0E6279J6rp24T_JVPdYVI7EJWlOwU&usqp=CAU",
    //     "name": "Chole Bhature",
    //     "tags": "North Indian, Street Food",
    //     "rating": "4.1",
    //     "time": "20 mins",
    //     "price": "₹100",
    //   },
    //   {
    //     "imageUrl": "https://cdn.pixabay.com/photo/2017/05/07/08/56/asian-2291908_1280.jpg",
    //     "name": "Veg Hakka Noodles",
    //     "tags": "Chinese, Thai",
    //     "rating": "4.3",
    //     "time": "28 mins",
    //     "price": "₹220",
    //   },
    //   {
    //     "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5v4CuaVXTORf6FjmWlwNr0n78vsp7sWaTNg&s",
    //     "name": "Butter Chicken with Naan",
    //     "tags": "North Indian, Punjabi",
    //     "rating": "4.5",
    //     "time": "32 mins",
    //     "price": "₹350",
    //   },
    //   {
    //     "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSB5Ra2utclWoPBEP-_ROifpOd6BKVbUQ6Kvg&s",
    //     "name": "Blueberry Pancakes",
    //     "tags": "Breakfast, Bakery",
    //     "rating": "4.4",
    //     "time": "26 mins",
    //     "price": "₹180",
    //   },
    //   {
    //     "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0WRx2xHEV_e4swSe6H_79CQpAlZDDd9xxQQ&s",
    //     "name": "Salmon Sushi Platter",
    //     "tags": "Japanese, Sushi",
    //     "rating": "4.6",
    //     "time": "40 mins",
    //     "price": "₹900",
    //   },
    //   {
    //     "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUoyVDy5wfiQ8zx_nN_gLSFGL5YyA5XIcy-Q&s",
    //     "name": "Aloo Tikki Chaat",
    //     "tags": "Chaat, Street Food",
    //     "rating": "4.0",
    //     "time": "20 mins",
    //     "price": "₹70",
    //   },
    // ];



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
                          "Foodgo,Mathura",
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
                          'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                       ),
                      radius: 16,
                    ),
                  ],
                ),

                const SizedBox(height: 16),


                SearchBar(),

                // 🔹 Search Bar
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: "Search for restaurants, dishes...",
                //     prefixIcon: const Icon(Icons.search),
                //     suffixIcon: const Icon(Icons.mic),
                //     filled: true,
                //     fillColor: Colors.grey[200],
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(12),
                //       borderSide: BorderSide.none,
                //     ),
                //   ),
                // ),



                const SizedBox(height: 16),

                // 🔹 Category Row (Delivery, Dining Out, Offers)
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     _buildCategoryButton(Icons.delivery_dining, "Delivery"),
                //     _buildCategoryButton(Icons.dining, "Dining Out"),
                //     _buildCategoryButton(Icons.local_offer, "Offers"),
                //   ],
                // ),

                const SizedBox(
                  height: 16,
                ),


                // spacing for future restaurant cards
                // ListView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: restaurantData.length,
                //   itemBuilder: (context, index) {
                //     final restaurant = restaurantData[index];
                //     return RestaurantCard(
                //       imageUrl: restaurant["imageUrl"]!,
                //       name: restaurant["name"]!,
                //       tags: restaurant["tags"]!,
                //       rating: restaurant["rating"]!,
                //       time: restaurant["time"]!,
                //       price: restaurant["price"]!,
                //     );
                //   },
                // ),

                StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('dishes').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No dishes found."));
                    }

                    final dishList = snapshot.data!.docs
                        .map((doc) => Dish.fromMap(doc.data() as Map<String, dynamic>))
                        .toList();

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dishList.length,
                      itemBuilder: (context, index) {
                        final dish = dishList[index];
                        return RestaurantCard(
                          name: dish.name,
                          imageUrl: dish.imageUrl,
                          price: dish.price,
                          rating: dish.rating,
                          tags: dish.tags,
                          time: dish.time,
                        );
                      },
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
