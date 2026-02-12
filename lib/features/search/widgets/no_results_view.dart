import 'package:flutter/material.dart';
    
class NoResultsView extends StatelessWidget {
  const NoResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.search_off,
                size: 80, color: Colors.grey),
            SizedBox(height: 20),
            Text(
              "No Results Found",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Try a different keyword",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}