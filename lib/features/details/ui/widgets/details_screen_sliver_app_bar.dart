import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsSliverAppBar extends StatelessWidget {
  final String? imagePath;
  final Widget? action;

  const DetailsSliverAppBar({super.key, this.imagePath, this.action});

  @override
  Widget build(BuildContext context) {
    final imageUrl = "$imageBaseUrl$imagePath";

    return SliverAppBar(
      backgroundColor: ColorsManager.primary,
      expandedHeight: 320.h,
      pinned: true,
      leading: const BackButton(color: Colors.white),
      actions: action != null ? [action!] : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            CustomCachedImage(
              imageUrl: imageUrl,
              width: double.infinity,
              height: 320.h,
              fit: BoxFit.cover,
            ),
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
