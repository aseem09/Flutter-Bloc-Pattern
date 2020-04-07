import 'package:flutter/material.dart';
import 'package:movies_bloc_pattern/blocs/movie_bloc.dart';
import 'package:movies_bloc_pattern/models/movie_list.dart';
import 'movie_info.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var movieBloc = MovieBloc();
    movieBloc.fetchMovies();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StreamBuilder(
            stream: movieBloc.movieListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return displayList(snapshot);
              } else {
                print("Data Snapshot is null");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget displayList(AsyncSnapshot<MovieListResponse> snapshot) {
    List<Movie> movies = snapshot.data.results;
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Image.network(
            "https://image.tmdb.org/t/p/w185${movies[index].posterPath}",
          ),
          title: Text(
            movies[index].title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            movies[index].originalTitle,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetails(
                movieId: movies[index].id,
              ),
            ),
          ),
        );
      },
    );
  }
}
