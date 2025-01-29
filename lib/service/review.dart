part of 'services.dart';

class ReviewServices {
  static Future<ApiReturnValue<List<Review>>> getReview(
      {int? id, http.Client? client}) async {
    client ??= http.Client();
    String url =
        '${baseURL}/movie/$id/reviews?language=en-US&page=1&api_key=$token';

    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List<Review> value =
          (data['results'] as Iterable).map((e) => Review.fromJson(e)).toList();
      return ApiReturnValue(value: value);
    } else {
      return ApiReturnValue(message: 'Failed to get review');
    }
  }
}
