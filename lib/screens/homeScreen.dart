import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          10,
          (index) => Center(
            child: Text('Item $index'),
          ),
        ),
      ),
    );
  }
}
