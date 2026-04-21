import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:cine_scope/features/home/logic/home_state.dart';
import 'package:cine_scope/features/home/ui/widgets/featured_movie_card.dart';
import 'package:cine_scope/features/home/ui/widgets/home_header.dart';
import 'package:cine_scope/features/home/ui/widgets/movie_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return LazyLoadScrollView(
              onEndOfPage: () {
                final cubit = context.read<HomeCubit>();

                if (!cubit.isClosed) {
                  cubit.loadMorePopular();
                }
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeHeader(),
                    verticalSpace(24),

                    /// Featured
                    FeaturedMovieCard(
                      media: state.trending.isNotEmpty
                          ? state.trending.first
                          : null,
                    ),

                    verticalSpace(32),

                    MovieSection(
                      title: "Trending Now",
                      media: state.trending,
                      status: state.trendingStatus,
                      onRetry: cubit.loadHomeData,
                    ),

                    MovieSection(
                      title: "Popular",
                      media: state.popular,
                      status: state.popularStatus,
                      onRetry: cubit.loadHomeData,
                    ),

                    MovieSection(
                      title: "Top Rated",
                      media: state.topRated,
                      status: state.topRatedStatus,
                      onRetry: cubit.loadHomeData,
                    ),

                    verticalSpace(24),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
