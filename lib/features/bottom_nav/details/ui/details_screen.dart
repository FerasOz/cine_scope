import 'package:cine_scope/features/bottom_nav/details/ui/widgets/Reviews_tab.dart';
import 'package:cine_scope/features/bottom_nav/details/ui/widgets/about_movie_tab.dart';
import 'package:cine_scope/features/bottom_nav/details/ui/widgets/cast_tab.dart';
import 'package:cine_scope/features/bottom_nav/details/ui/widgets/details_screen_sliver_app_bar.dart';
import 'package:cine_scope/features/bottom_nav/details/ui/widgets/details_tabs.dart';
import 'package:cine_scope/features/bottom_nav/details/ui/widgets/movie_info_section.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/data/models/watchlist_movie.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/logic/watchlist_cubit.dart';
import 'package:cine_scope/features/bottom_nav/watch_list/logic/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/features/bottom_nav/details/logic/movie_details_cubit.dart';
import 'package:cine_scope/features/bottom_nav/details/logic/movie_details_state.dart';
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

          return BlocBuilder<WatchlistCubit, WatchlistState>(
            builder: (context, watchState) {
              final watchCubit = context.read<WatchlistCubit>();
              final isSaved = watchCubit.isSaved(movie.id);

              return DefaultTabController(
                length: 3,
                child: CustomScrollView(
                  slivers: [
                    DetailsSliverAppBar(
                      imagePath: movie.backdropPath,
                      action: IconButton(
                        icon: Icon(
                          isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: isSaved ? Colors.orange : Colors.white,
                        ),
                        onPressed: () async {
                          final watchMovie = WatchlistMovie(
                            id: movie.id,
                            title: movie.title,
                            posterPath: movie.posterPath,
                            voteAverage: movie.voteAverage,
                          );

                          final cubit = context.read<WatchlistCubit>();
                          final wasSaved = cubit.isSaved(movie.id);

                          await cubit.toggleMovie(watchMovie);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                wasSaved
                                    ? "Removed from Watchlist"
                                    : "Added to Watchlist",
                              ),
                              backgroundColor: wasSaved
                                  ? Colors.redAccent
                                  : Colors.orange,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
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
          );
        },
      ),
    );
  }
}
