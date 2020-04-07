import 'dart:async';
import 'package:movies_bloc_pattern/models/movie_info.dart';
import 'package:movies_bloc_pattern/models/movie_list.dart';
import 'package:movies_bloc_pattern/services/repository.dart';
import 'bloc.dart';

class MovieBloc implements Bloc {
  final _repository = new Repository();
  final _movieListController = new StreamController<MovieListResponse>();
  final _movieInfoController = new StreamController<MovieInfoResponse>();

  Stream<MovieListResponse> get movieListStream {
    return _movieListController.stream;
  }

  Stream<MovieInfoResponse> get movieInfoStream {
    return _movieInfoController.stream;
  }

  fetchMovies() async {
    var movieListResponse = await _repository.getAllMovies();
    _movieListController.sink.add(movieListResponse);
  }

  fetchMovieDetails(int movieId) async {
    var movieInfoResponse = await _repository.getMovieDetails(movieId);
    _movieInfoController.sink.add(movieInfoResponse);
  }

  dispose() {
    _movieListController.close();
    _movieInfoController.close();
  }
}
