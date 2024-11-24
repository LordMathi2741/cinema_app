import 'package:cinema/core/movie_sections.dart';
import 'package:cinema/features/movies/presentation/widgets/movie_list.dart';
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
            SizedBox(
            height: 440,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    MovieSections.nowPlaying.section,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: MovieList(
                    movieSection: MovieSections.nowPlaying.endpoint,
                  ),
                ),
              ],
            ),
          ),
            SizedBox(
              height: 440,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      MovieSections.upComing.section,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: MovieList(
                      movieSection: MovieSections.upComing.endpoint,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 440,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      MovieSections.popular.section,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: MovieList(
                      movieSection: MovieSections.popular.endpoint,
                    ),
                  ),
                ],
              ),
            ),
         ],
             ),
      )
    );
  }
}
