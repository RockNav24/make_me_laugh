import 'package:flutter/material.dart';
import 'package:make_me_laugh/api/joke.dart';
import 'package:make_me_laugh/api/services.dart';
import 'package:make_me_laugh/jokeCard.dart';

class JokeScreen extends StatefulWidget {
  static const String SCREEN_NAME = 'jokeScreen';
  JokeScreen({Key key}) : super(key: key);

  @override
  _JokeScreenState createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  Future<Joke> futureJoke;

  @override
  void initState() {
    super.initState();
    futureJoke = fetchJokes();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: FutureBuilder<Joke>(
              future: futureJoke,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('has data');
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: JokeCard(
                      joke: snapshot.data.getJoke() != null
                          ? snapshot.data.getJoke()
                          : '',
                    ),
                  );
                } else if (snapshot.hasError) {
                  print('error');
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Text('Why?'),
            onPressed: () async {
              print('button works');
              Joke result = await futureJoke;
              result.getAnswer();
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: RaisedButton(
            child: Text('Laugh More'),
            onPressed: () {
              print('button works');
              setState(() {
                futureJoke = fetchJokes();
              });
            },
          ),
        ),
      ],
    );
  }
}
