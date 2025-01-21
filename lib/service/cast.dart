part of 'services.dart';

class CastServices {
  static Future<ApiReturnValue<List<Cast>>> getCast(
      {int? id, http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}/movie/$id/credits?language=en-US&page=1&api_key=$token';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Cast> value = (data['cast'] as Iterable)
          .map((e) => Cast.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get cast');
    }
  }
}
