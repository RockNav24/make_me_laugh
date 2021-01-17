import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String joke;
  JokeCard({this.joke});

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(joke,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black87,
          ),
        ),
        Positioned(
          top: -30,
          child: Text(
            "😜",
            style: TextStyle(fontSize: 80, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
