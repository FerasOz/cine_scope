import 'package:flutter/material.dart';

class DetailsTabs extends StatelessWidget {
  const DetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      indicatorColor: Colors.redAccent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(text: "About Movie"),
        Tab(text: "Reviews"),
        Tab(text: "Cast"),
      ],
    );
  }
}
