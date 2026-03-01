import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_movie.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/logic/watchlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchlistItem extends StatelessWidget {
  final WatchlistMovie movie;

  const WatchlistItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WatchlistCubit>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.network(
            movie.posterPath != null
                ? "https://image.tmdb.org/t/p/w500${movie.posterPath}"
                : "https://via.placeholder.com/500x750?text=No+Image",
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
                movie.title,
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
                  Text(
                    movie.voteAverage.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.bookmark_remove, color: Colors.redAccent),
          onPressed: () {
            cubit.toggleMovie(movie);
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
