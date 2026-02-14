import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/details/widgets/Reviews_tab.dart';
import 'package:cine_scope/features/details/widgets/about_movie_tab.dart';
import 'package:cine_scope/features/details/widgets/cast_tab.dart';
import 'package:cine_scope/features/details/widgets/details_screen_sliver_app_bar.dart';
import 'package:cine_scope/features/details/widgets/details_tabs.dart';
import 'package:cine_scope/features/details/widgets/movie_info_section.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: CustomScrollView(
        slivers: [
          const DetailsSliverAppBar(),
          SliverToBoxAdapter(child: MovieInfoSection()),
          SliverToBoxAdapter(
            child: DetailsTabs(tabController: _tabController),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AboutMovieTab(),
                ReviewsTab(),
                CastTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}