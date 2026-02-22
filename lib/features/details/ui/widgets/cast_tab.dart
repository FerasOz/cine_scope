import 'package:flutter/material.dart';

class CastTab extends StatelessWidget {
  const CastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.75,
      children: const [
        CastItem(name: "Tom Holland"),
        CastItem(name: "Zendaya"),
        CastItem(name: "Benedict Cumberbatch"),
        CastItem(name: "Brad Pitt"),
      ],
    );
  }
}

class CastItem extends StatelessWidget {
  final String name;
  const CastItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(radius: 40),
        const SizedBox(height: 8),
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ],
    );
  }
}
