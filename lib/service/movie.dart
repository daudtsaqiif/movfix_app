part of 'services.dart';

class MovieServices {
  static Future<ApiReturnValue<List<Movie>>> getPopularMovie(
      {http.Client? client}) async {
    client ??= http.Client();
    String url =
        '${baseURL}/movie/popular?language=en-US&page=1&api_key=$token';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> value = (data['results'] as Iterable)
          .map((e) => PopularMovie.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get movie');
    }
  }

  static Future<ApiReturnValue<List<Movie>>> getRecommendationMovie(
      {int? id, http.Client? client}) async {
    client ??= http.Client();
    String url =
        '${baseURL}/movie/$id/recommendations?language=en-US&page=1&api_key=$token';

    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> value = (data['results'] as Iterable)
          .map((e) => RecommendationMovie.fromJson(e))
          .toList();
      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get recommendation');
    }
  }

  static Future<ApiReturnValue<List<Movie>>> getPlayingMovie(
      {http.Client? client}) async {
    client ??= http.Client();

    String url =
        '${baseURL}/movie/now_playing?language=en-US&page=1&api_key=$token';
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> value = (data['results'] as Iterable)
          .map((e) => PlayingMovie.fromJson(e))
          .toList();
      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get playing');
    }
  }

  static Future<ApiReturnValue<List<Movie>>> getUpcomingMovie(
      {http.Client? client}) async {
    client ??= http.Client();

    String url =
        '${baseURL}/movie/upcoming?language=en-US&page=1&api_key=$token';
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> value = (data['results'] as Iterable)
          .map((e) => UpcomingMovie.fromJson(e))
          .toList();
      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get playing');
    }
  }
}
