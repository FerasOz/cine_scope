import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_cubit.dart';
import 'package:cine_scope/features/bottom_nav/search/logic/search_state.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/no_results_view.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/search_initial_view.dart';
import 'package:cine_scope/features/bottom_nav/search/ui/widgets/search_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        /// INITIAL
        if (state.status == RequestsStatus.initial) {
          return const SearchInitialView();
        }

        /// LOADING
        if (state.status == RequestsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
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

        /// SUCCESS
        if (state.movies.isEmpty) {
          return const NoResultsView();
        }

        return ListView.builder(
          itemCount: state.movies.length,
          itemBuilder: (context, index) {
            final movie = state.movies[index];

            return SearchResultItem(
              imageUrl: movie.posterPath ?? "",
              movieId: movie.id,
              title: movie.title,
              rating: movie.rating.toStringAsFixed(1),
              year: movie.releaseDate ?? "",
            );
          },
        );
      },
    );
  }
}
