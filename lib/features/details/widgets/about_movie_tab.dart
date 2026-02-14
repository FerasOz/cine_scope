import 'package:flutter/material.dart';

class AboutMovieTab extends StatelessWidget {
  const AboutMovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(
        "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government.",
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
    );
  }
}