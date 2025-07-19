class Dish {
  final String name;
  final String imageUrl;
  final String price;
  final String rating;
  final String tags;
  final String time;

  Dish({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.tags,
    required this.time,
  });

  // Factory constructor to create a Dish from Firestore document
  factory Dish.fromMap(Map<String, dynamic> data) {
    return Dish(
      name: data['name'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      price: data['price'] ?? '',
      rating: data['rating'] ?? '',
      tags: data['tags'] ?? '',
      time: data['time'] ?? '',
    );
  }
}
