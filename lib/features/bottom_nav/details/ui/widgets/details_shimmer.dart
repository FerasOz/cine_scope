import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsShimmer extends StatelessWidget {
  const DetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300.h,
            width: double.infinity,
            color: Colors.grey.shade800,
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _box(width: 200, height: 20),
                const SizedBox(height: 12),
                _box(width: 100, height: 16),
                const SizedBox(height: 16),
                _box(width: double.infinity, height: 14),
                const SizedBox(height: 8),
                _box(width: double.infinity, height: 14),
                const SizedBox(height: 8),
                _box(width: 250, height: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _box({required double width, required double height}) {
    return Container(
      width: width.w,
      height: height.h,
      color: Colors.grey.shade700,
    );
  }
}
