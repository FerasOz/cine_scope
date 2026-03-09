import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/bottom_nav/home/data/models/media_model.dart';
import 'package:cine_scope/features/bottom_nav/home/logic/home_cubit.dart';
import 'package:cine_scope/features/bottom_nav/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CineScope",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.textPrimary,
                ),
              ),
              verticalSpace(4),
              Text(
                "Discover movies & series",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: ColorsManager.textSecondary,
                ),
              ),
            ],
          ),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return ToggleButtons(
                borderColor: Colors.orange,
                selectedColor: Colors.white,
                color: Colors.white,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                selectedBorderColor: Colors.orange,
                fillColor: Colors.orange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8.r),
                isSelected: [
                  state.currentType == MediaType.movie,
                  state.currentType == MediaType.tv,
                ],
                onPressed: (index) {
                  final type = index == 0 ? MediaType.movie : MediaType.tv;

                  context.read<HomeCubit>().changeType(type);
                },
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Movies"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Series"),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
