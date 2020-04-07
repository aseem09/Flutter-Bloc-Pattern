import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:movies_bloc_pattern/blocs/connectivity_bloc.dart';
import 'package:movies_bloc_pattern/blocs/movie_bloc.dart';
import 'package:movies_bloc_pattern/models/movie_info.dart';

class MovieDetails extends StatelessWidget {
  final movieId;

  const MovieDetails({Key key, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieBloc = MovieBloc();
    var connectivityBloc = ConnectivityBloc();
    connectivityBloc.checkNetworkStatus();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: StreamBuilder(
            initialData: ConnectivityResult.none,
            stream: connectivityBloc.connectivityResultStream,
            builder: (context, snapshot) {
              if (snapshot.data != ConnectivityResult.none) {
                movieBloc.fetchMovieDetails(movieId);
                return StreamBuilder(
                  stream: movieBloc.movieInfoStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return displayDetails(snapshot);
                    } else {
                      print("Data Snapshot is being loaded");
                    }
                    return displayLoading();
                  },
                );
              } else {
                return displayError();
              }
            },
          ),
        ),
      ),
    );
  }

  displayDetails(AsyncSnapshot<MovieInfoResponse> snapshot) {
    return Text(snapshot.data.results[0].name);
  }

  displayLoading() {
    return Text("Loading...");
  }

  displayError() {
    return Text("Something went wrong");
  }
}
