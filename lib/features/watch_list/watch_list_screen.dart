import 'package:flutter/material.dart';
    
class WatchListScreen extends StatelessWidget {

  const WatchListScreen({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch List'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text('Your watch list is empty.'),
      ),
    );
  }
}