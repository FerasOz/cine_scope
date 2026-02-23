import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/details/data/models/casts/cast_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final actor = casts[index];

        return Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundImage: actor.imageUrl.isNotEmpty
                  ? NetworkImage(actor.imageUrl)
                  : null,
            ),
            verticalSpace(8),
            Text(
              actor.character,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
          ],
        );
      },
    );
  }
}
