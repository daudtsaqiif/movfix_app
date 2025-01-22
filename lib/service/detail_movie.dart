part of 'services.dart';

class DetailMovieServices {
  static Future<ApiReturnValue<DetailMove>> getDetailMovie(
      {int? id, http.Client? client}) async {
        client ??= http.Client();

        String url = '${baseURL}/movie/$id?language=en-US&api_key=$token';

        var response = await client.get(Uri.parse(url));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          DetailMove value = DetailMove.fromJson(data);

          return ApiReturnValue(value: value);
        } else {
          return ApiReturnValue(message: 'Failed to get details');
        }
      }
}
