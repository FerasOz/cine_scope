import 'package:cine_scope/features/details/ui/widgets/Reviews_tab.dart';
import 'package:cine_scope/features/details/ui/widgets/about_movie_tab.dart';
import 'package:cine_scope/features/details/ui/widgets/cast_tab.dart';
import 'package:cine_scope/features/details/ui/widgets/details_screen_sliver_app_bar.dart';
import 'package:cine_scope/features/details/ui/widgets/details_tabs.dart';
import 'package:cine_scope/features/details/ui/widgets/movie_info_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/features/details/logic/movie_details_cubit.dart';
import 'package:cine_scope/features/details/logic/movie_details_state.dart';
import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state.status == RequestsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == RequestsStatus.error) {
            return Center(
              child: Text(
                state.error ?? "Something went wrong",
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          final movie = state.movieDetails;

          if (movie == null) {
            return const SizedBox();
          }

          return DefaultTabController(
            length: 3,
            child: CustomScrollView(
              slivers: [
                DetailsSliverAppBar(imagePath: movie.backdropPath),
                SliverToBoxAdapter(child: MovieInfoSection(movie: movie)),
                const SliverToBoxAdapter(child: DetailsTabs()),
                SliverFillRemaining(
                  child: TabBarView(
                    children: [
                      AboutMovieTab(overview: movie.overview ?? ""),
                      ReviewsTab(reviews: state.reviews ?? []),
                      CastTab(casts: state.casts ?? []),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
