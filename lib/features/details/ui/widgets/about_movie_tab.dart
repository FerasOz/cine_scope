import 'package:flutter/material.dart';

class AboutMovieTab extends StatelessWidget {
  final String overview;

  const AboutMovieTab({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        overview,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}
