import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutMovieTab extends StatelessWidget {
  final String overview;

  const AboutMovieTab({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        overview,
        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
      ),
    );
  }
}
