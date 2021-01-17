import 'package:http/http.dart' as http;
import 'dart:convert';
import 'joke.dart';

const String url = 'https://jokeapi-v2.p.rapidapi.com/joke/Any';
Map<String, String> header = {
  'x-rapidapi-key': "35efe94b95msha287d222b8a5474p11e5acjsn519352a77cb3",
  'x-rapidapi-host': "jokeapi-v2.p.rapidapi.com",
  "useQueryString": 'true',
};

Future<Joke> fetchJokes() async {
  final response = await http.get(url, headers: header);

  if (response.statusCode == 200) {
    print("loading data");
    return Joke.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load the joke.');
  }
}
