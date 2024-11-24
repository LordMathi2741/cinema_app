import 'package:cinema/core/movie_sections.dart';
import 'package:cinema/features/movies/presentation/widgets/movie_section_swiper.dart';
import 'package:cinema/shared/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CinemaMenuScreen extends StatelessWidget {
  const CinemaMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text("Cinema App"),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieSectionSwiper(section: MovieSections.nowPlaying.section, endpoint:  MovieSections.nowPlaying.endpoint),
            MovieSectionSwiper(section: MovieSections.upComing.section, endpoint:  MovieSections.upComing.endpoint),
            MovieSectionSwiper(section: MovieSections.popular.section, endpoint:  MovieSections.popular.endpoint),
         ],
        ),
      )
    );
  }
}
