import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/home/logic/home_cubit.dart';
import 'package:cine_scope/features/home/logic/home_state.dart';
import 'package:cine_scope/features/home/ui/widgets/featured_movie_card.dart';
import 'package:cine_scope/features/home/ui/widgets/home_header.dart';
import 'package:cine_scope/features/home/ui/widgets/movie_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  verticalSpace(24),

                  /// Featured Movie (أول فيلم من Trending)
                  FeaturedMovieCard(
                    movie: state.trendingMovies.isNotEmpty
                        ? state.trendingMovies.first
                        : null,
                  ),

                  verticalSpace(32),

                  MoviesSection(
                    title: "Trending Now",
                    movies: state.trendingMovies,
                    status: state.trendingStatus,
                  ),

                  MoviesSection(
                    title: "Popular Movies",
                    movies: state.popularMovies,
                    status: state.popularStatus,
                  ),

                  MoviesSection(
                    title: "Top Rated",
                    movies: state.topRatedMovies,
                    status: state.topRatedStatus,
                  ),

                  verticalSpace(24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
