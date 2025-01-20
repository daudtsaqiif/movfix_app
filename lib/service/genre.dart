part of 'services.dart';

class GenreServices {
  static Future<ApiReturnValue<List<Genre>>> getGenres(
      {http.Client? client}) async {
    client ??= http.Client();
    String url =
        '${baseURL}/genre/movie/list?language=en-US&page=1&api_key=$token';

    var respose = await client.get(Uri.parse(url));

    if (respose.statusCode == 200) {
      var data = jsonDecode(respose.body);
      List<Genre> value = (data['genres'] as Iterable)
          .map((e) => Genre.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get genre');
    }
  }
}
