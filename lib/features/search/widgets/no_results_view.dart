import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
    
class NoResultsView extends StatelessWidget {
  const NoResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/no_result.svg",
              height: 150.h,
            ),
            verticalSpace(24),
            Text(
              "No Results Found",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold),
            ),
            verticalSpace(8),
            Text(
              "Try a different keyword",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}