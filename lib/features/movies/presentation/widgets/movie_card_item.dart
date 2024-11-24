import 'package:cinema/features/movies/data/local/movies_repository.dart';
import 'package:cinema/features/movies/domain/model/movieDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCardItem extends StatefulWidget {
  final String image;
  final String title;
  final String overview;
  const MovieCardItem({
    super.key,
    required this.image,
    required this.title,
    required this.overview,
  });

  @override
  State<MovieCardItem> createState() => _MovieCardItemState();
}

class _MovieCardItemState extends State<MovieCardItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final movieRepository = MovieRepository();
    final favoriteStatus = await movieRepository.isAlreadyInFavorites(widget.title);
    setState(() {
      isFavorite = favoriteStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieRepository = MovieRepository();

    return SizedBox(
      width: 200,
      child: Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.image),
            const SizedBox(height: 10),
            Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () async {
                final movieToInsert = MovieDTO(
                  id: null,
                  title: widget.title,
                  overview: widget.overview,
                  image: widget.image,
                );

                if (isFavorite) {
                  final movie = await movieRepository.getMovieByTitle(widget.title);
                  if (movie != null) {
                    await movieRepository.delete(movie.id!);
                  }
                  setState(() {
                    isFavorite = false;
                  });
                } else {
                  await movieRepository.insert(movieToInsert);
                  setState(() {
                    isFavorite = true;
                  });
                }
              },
              icon: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
