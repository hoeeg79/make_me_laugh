import 'dart:convert';
import 'JokesDto.dart';
import 'package:http/http.dart' as http;

const url = 'https://v2.jokeapi.dev/joke/Miscellaneous,Dark,Pun,Spooky';

class DataSource {
  Future<JokeDto> getJoke() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final map = jsonDecode(response.body);
      return JokeDto.fromJson(map);
    } else {
      throw Exception('Failed to load joke');
    }
  }
}