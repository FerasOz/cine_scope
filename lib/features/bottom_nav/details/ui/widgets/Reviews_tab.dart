import 'package:cine_scope/features/bottom_nav/details/data/models/review/review_model.dart';
import 'package:cine_scope/features/bottom_nav/details/logic/media_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class ReviewsTab extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsTab({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const Center(
        child: Text("No Reviews Yet", style: TextStyle(color: Colors.grey)),
      );
    }

    return LazyLoadScrollView(
      onEndOfPage: () {
        context.read<MediaDetailsCubit>().loadMoreReviews();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: reviews.length + 1,
        itemBuilder: (context, index) {
          if (index == reviews.length) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: CircularProgressIndicator(color: Colors.orange),
              ),
            );
          }

          final review = reviews[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              review.content,
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
