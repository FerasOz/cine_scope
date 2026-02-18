import 'package:cine_scope/core/helpers/spacing.dart';
import 'package:cine_scope/core/styles/colors.dart';
import 'package:cine_scope/features/home/ui/widgets/featured_movie_card.dart';
import 'package:cine_scope/features/home/ui/widgets/home_header.dart';
import 'package:cine_scope/features/home/ui/widgets/movie_section.dart';
import 'package:flutter/material.dart';
    
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              verticalSpace(24),
              FeaturedMovieCard(),
              verticalSpace(32),
              MoviesSection(title: "Trending Now"),
              MoviesSection(title: "Popular Movies"),
              MoviesSection(title: "Top Rated"),
              verticalSpace(24),
            ],
          ),
        ),
      ),
    );
  }
}