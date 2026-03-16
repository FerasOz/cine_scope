import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_cubit.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_state.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/no_results_view.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/search_initial_view.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/search_result_item.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/search_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();

        /// INITIAL
        if (state.status == RequestsStatus.initial) {
          return const SearchInitialView();
        }

        /// LOADING (first search)
        if (state.status == RequestsStatus.loading && state.results.isEmpty) {
          return const SearchShimmer();
        }

        /// ERROR
        if (state.status == RequestsStatus.error) {
          return Center(
            child: Text(
              state.error ?? "Something went wrong",
              style: const TextStyle(color: Colors.white),
            ),
          );
        }

        /// EMPTY
        if (state.results.isEmpty) {
          return const NoResultsView();
        }

        return LazyLoadScrollView(
          onEndOfPage: () {
            cubit.loadMore();
          },
          child: ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              final movie = state.results[index];

              return SearchResultItem(
                imageUrl: movie.posterPath ?? "",
                movieId: movie.id,
                title: movie.title,
                rating: movie.rating,
                date: movie.releaseDate,
                type: movie.type,
              );
            },
          ),
        );
      },
    );
  }
}
