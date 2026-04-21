import 'package:cine_scope/core/widgets/error_view.dart';
import 'package:cine_scope/features/details/ui/widgets/Reviews_tab.dart';
import 'package:cine_scope/features/details/ui/widgets/about_movie_tab.dart';
import 'package:cine_scope/features/details/ui/widgets/cast_tab.dart';
import 'package:cine_scope/features/details/ui/widgets/details_screen_sliver_app_bar.dart';
import 'package:cine_scope/features/details/ui/widgets/details_shimmer.dart';
import 'package:cine_scope/features/details/ui/widgets/details_tabs.dart';
import 'package:cine_scope/features/details/ui/widgets/movie_info_section.dart';
import 'package:cine_scope/features/watch_list/data/models/watchlist_model.dart';
import 'package:cine_scope/features/watch_list/logic/watchlist_cubit.dart';
import 'package:cine_scope/features/watch_list/logic/watchlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cine_scope/features/details/logic/media_details_cubit.dart';
import 'package:cine_scope/features/details/logic/media_details_state.dart';
import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, this.heroImagePath, this.heroTag});

  final String? heroImagePath;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: BlocBuilder<MediaDetailsCubit, MediaDetailsState>(
        builder: (context, state) {
          if (state.status == RequestsStatus.loading) {
            if (heroImagePath == null) {
              return const DetailsShimmer();
            }

            return CustomScrollView(
              slivers: [
                DetailsSliverAppBar(imagePath: heroImagePath, heroTag: heroTag),
                const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  ),
                ),
              ],
            );
          }

          if (state.status == RequestsStatus.error) {
            return ErrorView(
              message: state.error ?? "Something went wrong",
              onRetry: () {
                context.read<MediaDetailsCubit>().getDetails(
                  type: state.type!,
                  id: state.id!,
                );
              },
            );
          }

          final media = state.details;
          if (media == null) return const SizedBox();

          return BlocBuilder<WatchlistCubit, WatchlistState>(
            builder: (context, watchState) {
              final watchCubit = context.read<WatchlistCubit>();
              final isSaved = watchCubit.isSaved(media.id);

              return DefaultTabController(
                length: 3,
                child: CustomScrollView(
                  slivers: [
                    DetailsSliverAppBar(
                      imagePath: media.backdropPath ?? heroImagePath,
                      heroTag: heroTag,
                      action: IconButton(
                        icon: Icon(
                          isSaved
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: isSaved ? Colors.orange : Colors.white,
                        ),
                        onPressed: () async {
                          final watchItem = WatchlistModel(
                            id: media.id,
                            title: media.title,
                            posterPath: media.posterPath,
                            backdropPath: media.backdropPath,
                            voteAverage: media.voteAverage,
                            type: state.type!,
                          );

                          await watchCubit.toggleMovie(watchItem);
                        },
                      ),
                    ),

                    SliverToBoxAdapter(child: MovieInfoSection(media: media)),

                    const SliverToBoxAdapter(child: DetailsTabs()),

                    SliverFillRemaining(
                      child: TabBarView(
                        children: [
                          AboutMovieTab(overview: media.overview ?? ""),

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
