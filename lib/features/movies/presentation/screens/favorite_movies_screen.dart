import 'package:cinema/features/movies/data/local/movies_repository.dart';
import 'package:cinema/features/movies/domain/model/movieDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/presentation/widgets/custom_navigation_bar.dart';
import 'movie_item_information.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieRepository = MovieRepository();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        title: const Text("Cinema App"),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      body: FutureBuilder<List<MovieDTO>?>(
          future: movieRepository.getAll(),
          builder: (context, snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No movies in Favorites"),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index){
                  return  Dismissible(
                    key: Key(snapshot.data![index].id!.toString()),
                    background: Container(
                      color: Colors.red,
                    ),
                    onDismissed: (direction) async{
                      await movieRepository.delete(snapshot.data![index].id!);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ListTile(
                          trailing: Image.network(snapshot.data![index].image),
                          title: Text(
                              snapshot.data![index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) =>
                                MovieItemInformation(
                                  image: snapshot.data![index].image,
                                  title: snapshot.data![index].title,
                                  overview: snapshot.data![index].overview,
                                )
                            )
                            );
                          }
                      ),
                    ),
                  );
                }
            );
          }
      )
    );
  }
}
