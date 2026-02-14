import 'package:flutter/material.dart';

class DetailsTabs extends StatelessWidget {
  final TabController tabController;
  const DetailsTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.redAccent,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.grey,
      tabs: const [
        Tab(text: "About Movie"),
        Tab(text: "Reviews"),
        Tab(text: "Cast"),
      ],
    );
  }
}
