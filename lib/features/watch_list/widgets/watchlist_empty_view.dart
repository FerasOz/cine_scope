import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WatchlistEmptyView extends StatelessWidget {
  const WatchlistEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/empty_watch_list.svg",
              height: 200.h,
            ),
            verticalSpace(20),
            Text(
              "There Is No Movie Yet!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpace(8),
            Text(
              "Find your movie by type title,\ncategories, years, etc",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
