import 'package:cine_scope/features/search/widgets/search_initial_view.dart';
import 'package:flutter/material.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    // حالياً نجرب حالة initial
    return const SearchInitialView();

    // لاحقاً مع Cubit:
    /*
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          return ListView.builder(
            itemCount: state.results.length,
            itemBuilder: (context, index) {
              final movie = state.results[index];
              return SearchResultItem(
                imageUrl: movie.posterPath,
                title: movie.title,
                rating: movie.voteAverage.toString(),
                year: movie.releaseDate,
              );
            },
          );
        } else if (state is SearchEmpty) {
          return const NoResultsView();
        } else {
          return const SearchInitialView();
        }
      },
    );
    */
  }
}
