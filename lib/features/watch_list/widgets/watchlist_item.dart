import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchlistItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final String genre;
  final String year;
  final String duration;

  const WatchlistItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.genre,
    required this.year,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            imageUrl,
            width: 80.w,
            height: 110.h,
            fit: BoxFit.cover,
          ),
        ),
        horizontalSpace(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpace(6),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  horizontalSpace(4),
                  Text(rating, style: const TextStyle(color: Colors.white)),
                ],
              ),
              verticalSpace(6),
              Row(
                children: [
                  _InfoItem(icon: Icons.movie, text: genre),
                  _InfoItem(icon: Icons.calendar_today, text: year),
                ],
              ),
              verticalSpace(6),
              _InfoItem(icon: Icons.access_time, text: duration),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_remove, color: Colors.redAccent),
          onPressed: () {
            // لاحقًا: remove from watchlist
          },
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.grey),
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
