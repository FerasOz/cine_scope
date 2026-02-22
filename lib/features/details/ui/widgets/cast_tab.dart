import 'package:cine_scope/features/details/data/models/casts/cast_model.dart';
import 'package:flutter/material.dart';

class CastTab extends StatelessWidget {
  final List<CastModel> casts;

  const CastTab({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    if (casts.isEmpty) {
      return const Center(child: Text("No Cast Available"));
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: casts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final actor = casts[index];

        return Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: actor.imageUrl.isNotEmpty
                  ? NetworkImage(actor.imageUrl)
                  : null,
            ),
            const SizedBox(height: 8),
            Text(actor.name),
          ],
        );
      },
    );
  }
}
