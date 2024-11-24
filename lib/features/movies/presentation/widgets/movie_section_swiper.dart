import 'package:cinema/features/movies/presentation/widgets/movie_list.dart';
import 'package:flutter/cupertino.dart';

class MovieSectionSwiper extends StatelessWidget {
  final String section;
  final String endpoint;
  const MovieSectionSwiper({super.key, required this.section, required this.endpoint});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 440,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              section,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: MovieList(
              movieSection: endpoint,
            ),
          ),
        ],
      ),
    );
  }
}
