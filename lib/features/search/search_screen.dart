import 'package:flutter/material.dart';
    
class SearchScreen extends StatelessWidget {

  const SearchScreen({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text('Search for movies and TV shows.'),
      ),
    );
  }
}