import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/custom_cached_image.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class FeaturedMovieCard extends StatelessWidget {
  final MediaModel? media;

  const FeaturedMovieCard({super.key, this.media});

  @override
  Widget build(BuildContext context) {
    final heroTag = media == null
        ? ''
        : 'featured_${media!.type.name}_${media!.id}';

    if (media == null) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade700,
        child: Container(
          height: 310.h,
          margin: EdgeInsets.symmetric(horizontal: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
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
          arguments: {
            "id": media!.id,
            "type": media!.type,
            "heroImagePath": media!.backdropPath,
            "heroTag": heroTag,
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Container(
          height: 310.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.r),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 22,
                offset: Offset(0, 14),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28.r),
            child: Stack(
              children: [
                Hero(
                  tag: heroTag,
                  child: CustomCachedImage(
                    imageUrl: media!.backdropPath != null
                        ? "$imageBaseUrl${media!.backdropPath}"
                        : "",
                    height: 310.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.96),
                          Colors.black.withValues(alpha: 0.52),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 18.h,
                  left: 18.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.38),
                      borderRadius: BorderRadius.circular(999.r),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.bolt_rounded,
                          color: Colors.orange,
                          size: 16,
                        ),
                        horizontalSpace(6),
                        Text(
                          media!.type == MediaType.movie
                              ? 'Featured Movie'
                              : 'Featured Series',
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
                  left: 18.w,
                  right: 18.w,
                  bottom: 18.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        media!.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                          letterSpacing: -0.6,
                        ),
                      ),
                      verticalSpace(12),
                      Row(
                        children: [
                          _MetaBadge(
                            icon: Icons.star_rounded,
                            label: media!.rating.toStringAsFixed(1),
                            foreground: Colors.white,
                            background: Colors.orange.withValues(alpha: 0.16),
                            iconColor: Colors.amber,
                          ),
                          horizontalSpace(10),
                          if (media!.year.isNotEmpty)
                            _MetaBadge(
                              icon: Icons.calendar_month_rounded,
                              label: media!.year,
                              foreground: ColorsManager.textPrimary,
                              background: Colors.white.withValues(alpha: 0.08),
                              iconColor: Colors.white70,
                            ),
                        ],
                      ),
                      verticalSpace(14),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(18.r),
                          border: Border.all(color: Colors.white12),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.play_circle_fill_rounded,
                              color: Colors.orange,
                              size: 22,
                            ),
                            horizontalSpace(8),
                            Text(
                              'Explore details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MetaBadge extends StatelessWidget {
  const _MetaBadge({
    required this.icon,
    required this.label,
    required this.foreground,
    required this.background,
    required this.iconColor,
  });

  final IconData icon;
  final String label;
  final Color foreground;
  final Color background;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999.r),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 16),
          horizontalSpace(5),
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
