import 'package:cinema/features/movies/presentation/widgets/movie_information_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieItemInformation extends StatelessWidget {
  final String image;
  final String overview;
  final String title;
  const MovieItemInformation({super.key, required this.image, required this.overview, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
              SliverAppBar(
              expandedHeight: 520,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  image,
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.noRepeat,
                ),
              ),
            )
          ];
        },
        body: MovieInformationCard(title: title, overview: overview)
      )
    );
  }
}
