import 'dart:async';
import 'package:flutter/material.dart';
import 'package:make_me_laugh/api/services.dart';
import 'api/joke.dart';
import 'jokeCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Joke> futureJoke;

  @override
  void initState() {
    super.initState();
    futureJoke = fetchJokes();
  }

  @override
  Widget build(BuildContext context) {
    AlertDialog answer = AlertDialog(
      title: Text("Answer"),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Make Me Laugh'),
          backgroundColor: Colors.black87,
        ),
        body: Column(
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
        ),
      ),
    );
  }
}
