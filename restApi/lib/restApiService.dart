import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample/album.dart';

class RestApiService {
  static final RestApiService _restApiService = RestApiService._internal();

  factory RestApiService() => _restApiService;

  RestApiService._internal();

  Future<Album> postAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    // 서버가 201 CREATED response를 return했을 때

    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post album.');
    }
  }

  Future<List<Album>> getAlbumList() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    final List<Album> result = jsonDecode(response.body)
        .map<Album>((json) => Album.fromJson(json))
        .toList();

    return result;
  }
}
