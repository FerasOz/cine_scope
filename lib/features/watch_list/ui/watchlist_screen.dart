import 'package:cine_scope/core/helpers/constants.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/core/widgets/error_view.dart';
import 'package:cine_scope/features/watch_list/logic/watchlist_cubit.dart';
import 'package:cine_scope/features/watch_list/logic/watchlist_state.dart';
import 'package:cine_scope/features/watch_list/ui/widgets/watchlist_empty_view.dart';
import 'package:cine_scope/features/watch_list/ui/widgets/watchlist_list_view.dart';
import 'package:cine_scope/features/watch_list/ui/widgets/watchlist_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        title: const Text("Watch list", style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<WatchlistCubit, WatchlistState>(
        builder: (context, state) {
          if (state.status == RequestsStatus.loading &&
              state.movies.isEmpty) {
            return const WatchlistShimmer();
          }

          if (state.status == RequestsStatus.error) {
            return ErrorView(
              message: state.error ?? 'Something went wrong.',
              onRetry: () => context.read<WatchlistCubit>().loadWatchlist(),
            );
          }

          if (state.movies.isEmpty) {
            return const WatchlistEmptyView();
          }

          return WatchlistListView(movies: state.movies);
        },
      ),
    );
  }
}
