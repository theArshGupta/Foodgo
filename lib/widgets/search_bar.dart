import 'package:flutter/material.dart';
import 'package:food_delivery/screens/search_page.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  final TextEditingController _searchController=TextEditingController();

  @override

  void dispose(){
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToSearchPage(String query){
    if(query.trim().isEmpty){
      return;
    }
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>SearchPage(query: query.trim())),
    );
  }
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onSubmitted: _navigateToSearchPage,
      decoration: InputDecoration(
        hintText: "Search for dishes...",
        prefixIcon: const Icon(Icons.search),
        // suffixIcon: IconButton(
        //   icon: const Icon(Icons.mic),
        //   onPressed: () {
        //     // Optional mic logic here
        //   },
        // ),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
