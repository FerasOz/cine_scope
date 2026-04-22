import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/home/data/models/media_model.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:cine_scope/features/home/logic/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.w, 18.h, 18.w, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CineScope",
                      style: TextStyle(
                        fontSize: 31.sp,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.8,
                        color: ColorsManager.textPrimary,
                      ),
                    ),
                    verticalSpace(6),
                    Text(
                      "Discover stories worth staying up for.",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: ColorsManager.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(18.r),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.local_fire_department_rounded,
                      color: Colors.orange,
                    ),
                    verticalSpace(4),
                    Text(
                      'Hot',
                      style: TextStyle(
                        color: ColorsManager.textPrimary,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(20),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: const Color(0xFF262626),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: Colors.white10),
                ),
                child: Row(
                  children: [
                    _TypePill(
                      label: 'Movies',
                      isSelected: state.currentType == MediaType.movie,
                      onTap: () {
                        context.read<HomeCubit>().changeType(MediaType.movie);
                      },
                    ),
                    horizontalSpace(10),
                    _TypePill(
                      label: 'Series',
                      isSelected: state.currentType == MediaType.tv,
                      onTap: () {
                        context.read<HomeCubit>().changeType(MediaType.tv);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TypePill extends StatelessWidget {
  const _TypePill({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFFF8A00), Color(0xFFFF6A00)],
                  )
                : null,
            color: isSelected ? null : Colors.transparent,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : ColorsManager.textSecondary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
