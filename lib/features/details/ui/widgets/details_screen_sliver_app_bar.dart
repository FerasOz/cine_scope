import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsSliverAppBar extends StatelessWidget {
  final String? imagePath;
  final Widget? action;
  final String? heroTag;

  const DetailsSliverAppBar({
    super.key,
    this.imagePath,
    this.action,
    this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = "$imageBaseUrl$imagePath";

    return SliverAppBar(
      backgroundColor: ColorsManager.primary,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      expandedHeight: 320.h,
      pinned: true,
      leading: const BackButton(color: Colors.white),
      actions: action != null ? [action!] : null,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (heroTag != null)
              Hero(
                tag: heroTag!,
                child: CustomCachedImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 320.h,
                  fit: BoxFit.cover,
                ),
              )
            else
              CustomCachedImage(
                imageUrl: imageUrl,
                width: double.infinity,
                height: 320.h,
                fit: BoxFit.cover,
              ),
            if (heroTag != null)
              const Positioned.fill(
                child: Material(color: Colors.transparent),
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
