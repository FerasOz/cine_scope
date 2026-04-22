import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';

class MediaItemWidget extends StatelessWidget {
  final MediaModel item;

  const MediaItemWidget({super.key, required this.item});

  String get _heroTag => 'home_list_${item.type.name}_${item.id}';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsScreen,
          arguments: {
            "id": item.id,
            "type": item.type,
            "heroImagePath": item.posterPath,
            "heroTag": _heroTag,
          },
        );
      },
      child: Container(
        width: 164.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          boxShadow: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 16,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Hero(
                  tag: _heroTag,
                  child: CustomCachedImage(
                    imageUrl: item.posterPath != null
                        ? "$imageBaseUrl${item.posterPath}"
                        : "",
                    fit: BoxFit.cover,
                    width: 164.w,
                    height: double.infinity,
                  ),
                ),
              ),
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.96),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.45),
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 14),
                      horizontalSpace(4),
                      Text(
                        item.rating.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(12.w, 26.h, 12.w, 12.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          height: 1.18,
                        ),
                      ),
                      verticalSpace(8),
                      Row(
                        children: [
                          if (item.year.isNotEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 5.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(999.r),
                              ),
                              child: Text(
                                item.year,
                                style: TextStyle(
                                  color: ColorsManager.textSecondary,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          if (item.year.isNotEmpty) horizontalSpace(6),
                          Expanded(
                            child: Text(
                              item.type == MediaType.movie ? 'Movie' : 'Series',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
