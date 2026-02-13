import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/watch_list/widgets/watchlist_empty_view.dart';
import 'package:cine_scope/features/watch_list/widgets/watchlist_list_view.dart';
import 'package:flutter/material.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isEmpty = false;

    return Scaffold(
      backgroundColor: ColorsManager.primary,
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        elevation: 0,
        title: const Text("Watch list", style: TextStyle(color: Colors.white)),
      ),
      body: isEmpty ? const WatchlistEmptyView() : const WatchlistListView(),
    );
  }
}
