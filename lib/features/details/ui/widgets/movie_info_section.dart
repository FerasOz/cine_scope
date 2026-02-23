import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/details/data/models/details/movie_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieInfoSection extends StatelessWidget {
  final MovieDetailsModel movie;

  const MovieInfoSection({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18.sp),
              horizontalSpace(4),
              Text(
                movie.voteAverage.toStringAsFixed(1),
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ],
          ),
          horizontalSpace(12),
          Row(
            children: [
              _InfoChip(
                icon: Icons.calendar_today,
                text: movie.releaseDate!.substring(0, 4),
              ),
              _InfoChip(
                icon: Icons.access_time,
                text: "${movie.runtime} Minutes",
              ),
              if (movie.genres.isNotEmpty)
                _InfoChip(icon: Icons.movie, text: movie.genres.first.name),
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
