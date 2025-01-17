import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movfix_app/model/models.dart';

part 'movie.dart';

String baseURL = 'https://api.themoviedb.org/3';
var token = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MDhlZWZiYmRkYmNlNTBiNjdiMjlkZmJkMjY1ZjEzZSIsIm5iZiI6MTczNjkyMjk5OC4yMDEsInN1YiI6IjY3ODc1Nzc2ZWU4NGZhNGRlZjdiZTRkZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mt7u-rqZ24vhXAQpPL1qgn8WzB-yBgvNGQWvgT3HDPI';

class ApiServices {
  static headersGet({String? token}) {
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token ?? token}'
    };
  }

  static headersPost({String? token}) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${token ?? token}'
    };
  }

  static Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    var response = await http.get(uri, headers: headersGet());

    if (response.statusCode != 200) {
      throw Exception('get $url failed');
    }

    return response;
  }

  static Future<dynamic> post(String url, {dynamic body}) async {
    var uri = Uri.parse(url);
    var response = await http.post(uri, headers: headersPost());

    if (response.statusCode != 200) {
      throw Exception('Post $url failed');
    }

    return response;
  }
}
