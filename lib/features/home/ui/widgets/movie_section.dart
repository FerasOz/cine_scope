import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/empty_state_view.dart';
import 'package:cine_scope/core/widgets/error_view.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';
import 'package:cine_scope/features/home/ui/widgets/horizontal_media_shimmer.dart';
import 'package:cine_scope/features/home/ui/widgets/horizontal_movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<MediaModel>? media;
  final RequestsStatus status;
  final VoidCallback? onRetry;

  const MovieSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.media,
    required this.status,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: ColorsManager.textPrimary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.4,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: ColorsManager.textSecondary,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(999.r),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  children: [
                    Text(
                      '${media?.length ?? 0}',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    horizontalSpace(6),
                    Text(
                      'Titles',
                      style: TextStyle(
                        color: ColorsManager.textSecondary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(14),
        SizedBox(height: 220.h, child: _buildContent()),
        verticalSpace(28),
      ],
    );
  }

  Widget _buildContent() {
    if (status == RequestsStatus.loading && media!.isEmpty) {
      return const HorizontalMediaShimmer();
    }

    if (status == RequestsStatus.error) {
      return ErrorView(
        message: 'We couldn\'t load $title right now.',
        onRetry: onRetry,
        compact: true,
        title: 'Unable to load section',
      );
    }

    if (media == null || media!.isEmpty) {
      return EmptyStateView(
        title: 'Nothing here yet',
        subtitle: 'Fresh titles for $title will appear here soon.',
        icon: Icons.movie_creation_outlined,
        compact: true,
      );
    }

    return HorizontalMoviesList(media: media!);
  }
}
