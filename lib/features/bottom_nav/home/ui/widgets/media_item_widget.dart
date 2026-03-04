import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:cine_scope/core/routing/routes.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';

class MediaItemWidget extends StatelessWidget {
  MediaModel item;

  MediaItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.detailsScreen,
          arguments: {"id": item.id, "type": item.type},
        );
      },
      child: Container(
        width: 150.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.4),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  item.posterPath != null
                      ? "https://image.tmdb.org/t/p/w500${item.posterPath}"
                      : "https://via.placeholder.com/500x750?text=No+Image",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(.9),
                        Colors.black.withOpacity(.0),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          SizedBox(width: 4.w),
                          Text(
                            item.rating.toStringAsFixed(1),
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
