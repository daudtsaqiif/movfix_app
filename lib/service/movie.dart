part of 'services.dart';

class MovieServices {
  static Future<ApiReturnValue<List<Movie>>> getMovies(
      {http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}/person/popular?language=en-US&page=1';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Movie> value = (data['data']['data'] as Iterable)
          .map((e) => PopularMovie.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get foods');
    }
  }
}
