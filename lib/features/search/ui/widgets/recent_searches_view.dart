import 'package:flutter/material.dart';

class RecentSearchesView extends StatelessWidget {
  final List<String> searches;
  final Function(String) onTap;
  final VoidCallback onClear;

  const RecentSearchesView({
    super.key,
    required this.searches,
    required this.onTap,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    if (searches.isEmpty) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recent", style: TextStyle(color: Colors.white)),
              TextButton(onPressed: onClear, child: const Text("Clear")),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: searches.map((e) {
              return GestureDetector(
                onTap: () => onTap(e),
                child: Chip(label: Text(e)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
