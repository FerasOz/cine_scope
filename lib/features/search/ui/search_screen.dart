import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/search/logic/search_cubit.dart';
import 'package:cine_scope/features/search/ui/widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SearchCubit>();
    final controller = TextEditingController();

    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        leading: const Icon(Icons.search, color: Colors.white),
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              cubit.onSearchChanged(value);
            },
            onSubmitted: (value) {
              cubit.onSearchSubmitted(value);
            },
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search movies or series...",
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(0xFF2A2A2A),

              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        controller.clear();
                        cubit.onSearchChanged("");
                      },
                    )
                  : null,

              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 12.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: const SearchBody(),
    );
  }
}
