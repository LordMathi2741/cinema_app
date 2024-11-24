import 'package:cinema/features/movies/data/remote/movie_service.dart';
import 'package:cinema/features/movies/domain/model/movieDTO.dart';
import 'package:cinema/features/movies/presentation/screens/movie_item_information.dart';
import 'package:cinema/features/movies/presentation/widgets/movie_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../core/constant.dart';
class MovieList extends StatefulWidget {
  final String movieSection;
  const MovieList({super.key, required this.movieSection});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final PagingController<int, MovieDTO> _pagingController = PagingController(firstPageKey: 0);
  final movieService = MovieService();
  @override
  void initState(){
    super.initState();
    _pagingController.addPageRequestListener((pageKey){
      _fetchPage(pageKey);
    });
  }
  Future<void> _fetchPage(int pageKey) async {
    try {
      final movies = await movieService.getMovies(widget.movieSection, pageKey +1);
      final isLastPage = movies.length < Constant.PAGE_SIZE;
      if (isLastPage) {
        _pagingController.appendLastPage(movies);
      } else {
        final nextPageKey = pageKey + movies.length;
        _pagingController.appendPage(movies, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
  @override
  Widget build(BuildContext context) {
    return PagedListView<int, MovieDTO>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<MovieDTO>(
        itemBuilder: (context, item, index) =>
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_) =>
                     MovieItemInformation(
                       image: item.image,
                       title: item.title,
                       overview: item.overview,
                   )
                  )
                 );
              },
              child: MovieCardItem(
                    image: item.image,
                    title: item.title,
                    overview: item.overview,
                ),
            ),
      ),
      scrollDirection: Axis.horizontal,
    );
  }
  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
