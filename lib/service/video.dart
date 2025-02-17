part of 'services.dart';

class VideoService {
  static Future<ApiReturnValue<List<Video>>> getVideo(
      {int? id, http.Client? client}) async {
    client ??= http.Client();
    String url = '${baseURL}/movie/$id/videos?language=en-US&api_key=$token';
    var response = await client.get(Uri.parse(url));

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Fialed to get video');
    } else {
      var data = jsonDecode(response.body);
      List<Video> video =
          (data['results'] as Iterable).map((e) => Video.fromJson(e)).toList();
      return ApiReturnValue(value: video);
    }
  }
}
