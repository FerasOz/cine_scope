import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';

class DetailsSliverAppBar extends StatelessWidget {
  final String? imagePath;

  const DetailsSliverAppBar({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "https://image.tmdb.org/t/p/w780$imagePath";

    return SliverAppBar(
      backgroundColor: ColorsManager.primary,
      expandedHeight: 320,
      pinned: true,
      leading: const BackButton(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(imageUrl, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [ColorsManager.primary, Colors.transparent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
