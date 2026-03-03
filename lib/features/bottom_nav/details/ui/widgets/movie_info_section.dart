import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/bottom_nav/details/data/models/details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieInfoSection extends StatelessWidget {
  final MediaDetailsModel media;

  const MovieInfoSection({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            media.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 4),
              Text(
                media.voteAverage.toStringAsFixed(1),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              if (media.year.isNotEmpty)
                _InfoChip(icon: Icons.calendar_today, text: media.year),

              if (media.duration > 0)
                _InfoChip(
                  icon: Icons.access_time,
                  text: "${media.duration} min",
                ),

              if (media.genres.isNotEmpty)
                _InfoChip(icon: Icons.movie, text: media.genres.first.name),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        children: [
          Icon(icon, size: 14.sp, color: Colors.grey),
          horizontalSpace(4),
          Text(
            text,
            style: TextStyle(color: Colors.grey, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
