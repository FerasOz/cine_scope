import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/empty_state_view.dart';
import 'package:cine_scope/features/details/data/models/review/review_model.dart';
import 'package:cine_scope/features/details/logic/media_details_cubit.dart';
import 'package:cine_scope/features/details/logic/media_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({
    super.key,
    required this.reviews,
  });

  final List<ReviewModel> reviews;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const EmptyStateView(
        title: 'No reviews yet',
        subtitle: 'Audience reactions and opinions will appear here once available.',
        icon: Icons.rate_review_outlined,
      );
    }

    return BlocBuilder<MediaDetailsCubit, MediaDetailsState>(
      builder: (context, state) {
        return LazyLoadScrollView(
          onEndOfPage: () {
            context.read<MediaDetailsCubit>().loadMoreReviews();
          },
          child: ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 28.h),
            itemCount: reviews.length + (state.isLoadingMoreReviews ? 1 : 0),
            separatorBuilder: (_, _) => SizedBox(height: 14.h),
            itemBuilder: (context, index) {
              if (index == reviews.length) {
                return const _ReviewLoaderCard();
              }

              final review = reviews[index];

              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: Duration(milliseconds: 220 + (index * 35)),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, 14 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: ReviewCard(review: review),
              );
            },
          ),
        );
      },
    );
  }
}

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final review = widget.review;
    final content = review.content.trim();
    final shouldCollapse = content.length > 220;

    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: Colors.white10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 12,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ReviewerAvatar(
                name: review.author,
                imageUrl: review.imageUrl,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.author,
                      style: TextStyle(
                        color: ColorsManager.textPrimary,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    verticalSpace(4),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999.r),
                      ),
                      child: Text(
                        'Audience Review',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(16),
          AnimatedCrossFade(
            firstChild: Text(
              content,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorsManager.textSecondary,
                fontSize: 13.sp,
                height: 1.7,
              ),
            ),
            secondChild: Text(
              content,
              style: TextStyle(
                color: ColorsManager.textSecondary,
                fontSize: 13.sp,
                height: 1.7,
              ),
            ),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 220),
          ),
          if (shouldCollapse) ...[
            verticalSpace(12),
            TextButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
              ),
              child: Text(_expanded ? 'Show less' : 'Read full review'),
            ),
          ],
        ],
      ),
    );
  }
}

class _ReviewerAvatar extends StatelessWidget {
  const _ReviewerAvatar({
    required this.name,
    required this.imageUrl,
  });

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isNotEmpty) {
      return CircleAvatar(
        radius: 24.r,
        backgroundColor: const Color(0xFF323232),
        backgroundImage: NetworkImage(imageUrl),
      );
    }

    return CircleAvatar(
      radius: 24.r,
      backgroundColor: Colors.orange.withValues(alpha: 0.15),
      child: Text(
        _initials(name),
        style: TextStyle(
          color: Colors.orange,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  String _initials(String value) {
    final parts = value.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts.first.isEmpty) {
      return 'R';
    }
    if (parts.length == 1) {
      return parts.first.substring(0, 1).toUpperCase();
    }
    return '${parts.first.substring(0, 1)}${parts[1].substring(0, 1)}'
        .toUpperCase();
  }
}

class _ReviewLoaderCard extends StatelessWidget {
  const _ReviewLoaderCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFF242424),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          const CircularProgressIndicator(color: Colors.orange),
          verticalSpace(12),
          Text(
            'Loading more reviews...',
            style: TextStyle(
              color: ColorsManager.textSecondary,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
