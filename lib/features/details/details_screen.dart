import 'package:flutter/material.dart';
    
class DetailsScreen extends StatelessWidget {

  const DetailsScreen({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text('Details screen content goes here.'),
      ),
    );
  }
}