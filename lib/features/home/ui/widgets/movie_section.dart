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
  final List<MediaModel>? media;
  final RequestsStatus status;
  final VoidCallback? onRetry;

  const MovieSection({
    super.key,
    required this.title,
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            title,
            style: TextStyle(
              color: ColorsManager.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        verticalSpace(12),
        SizedBox(height: 180.h, child: _buildContent()),
        verticalSpace(24),
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
