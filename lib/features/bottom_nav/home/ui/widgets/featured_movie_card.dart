import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedMovieCard extends StatelessWidget {
  final MediaModel? media;

  const FeaturedMovieCard({super.key, this.media});

  @override
  Widget build(BuildContext context) {
    if (media == null) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade700,
        child: Container(
          height: 240.h,
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.grey,
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsScreen,
          arguments: {"id": media!.id, "type": media!.type},
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Stack(
            children: [
              Image.network(
                "https://image.tmdb.org/t/p/w780${media!.backdropPath}",
                height: 240.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 240.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.85),
                      Colors.black.withOpacity(0.35),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 16.w,
                bottom: 16.h,
                right: 16.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      media!.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalSpace(6),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        horizontalSpace(4),
                        Text(
                          media!.rating.toStringAsFixed(1),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
