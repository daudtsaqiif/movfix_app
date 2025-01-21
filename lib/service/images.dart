part of 'services.dart';

class ImagesService {
  static Future<ApiReturnValue<List<Images>>> getImages(
      {int? id,http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}/movie/$id/images?page=1&api_key=$token';

    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Images> value = (data['backdrops'] as Iterable)
          .map((e) => Images.fromJson(e))
          .toList();

      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get image');
    }
  }
}
