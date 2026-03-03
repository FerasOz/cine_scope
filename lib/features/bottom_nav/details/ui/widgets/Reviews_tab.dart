import 'package:cine_scope/features/bottom_nav/details/data/models/review/review_model.dart';
import 'package:flutter/material.dart';

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

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        final review = reviews[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            review.content,
            style: const TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
