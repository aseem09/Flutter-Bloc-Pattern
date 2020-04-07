import 'package:movies_bloc_pattern/globals.dart';
import 'package:movies_bloc_pattern/models/movie_info.dart';
import 'package:movies_bloc_pattern/models/movie_list.dart';
import 'package:http/http.dart' as http;

var header = {"Content-Type": "application/json"};

class MovieDataProvider {
  http.Client httpClient = new http.Client();

  Future<MovieListResponse> getMovieList() async {
    try {
      var response = await httpClient.get(movieListUrl, headers: header);
      print(response.body);
      MovieListResponse responseObject = responseModelFromJson(response.body);
      if (response.statusCode == 200) {
        return responseObject;
      } else {
        throw Exception("Error in fetching");
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  Future<MovieInfoResponse> getMovieInfo(int movieId) async {
    try {
      String url = movieInfoUrl + movieId.toString() + movieInfoEndpoint;
      var response = await httpClient.get(url, headers: header);
      print(response.body);
      MovieInfoResponse responseObject =
          movieInfoResponseFromJson(response.body);
      if (response.statusCode == 200) {
        return responseObject;
      } else {
        throw Exception("Error in fetching");
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  closeConnection() {
    httpClient.close();
  }
}
