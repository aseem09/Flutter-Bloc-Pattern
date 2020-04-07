import 'package:movies_bloc_pattern/models/movie_info.dart';
import 'package:movies_bloc_pattern/models/movie_list.dart';
import 'package:movies_bloc_pattern/services/movie_provider.dart';

class Repository {
  final movieListProvider = MovieDataProvider();

  Future<MovieListResponse> getAllMovies() {
    return movieListProvider.getMovieList();
  }

  Future<MovieInfoResponse> getMovieDetails(int movieId) {
    return movieListProvider.getMovieInfo(movieId);
  }
}
