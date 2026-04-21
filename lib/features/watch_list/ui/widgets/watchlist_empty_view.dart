import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WatchlistEmptyView extends StatelessWidget {
  const WatchlistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/empty_watch_list.svg",
              height: 200.h,
            ),
            verticalSpace(20),
            Text(
              "Your watch list is empty",
              style: TextStyle(
                color: ColorsManager.textPrimary,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            verticalSpace(8),
            Text(
              "Save movies and series you want to revisit later.\nStart exploring and tap the bookmark icon.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsManager.textSecondary,
                fontSize: 13.sp,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
