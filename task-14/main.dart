import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GalleryScreen());
  }
}

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 14')),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          for (int i = 1; i <= 6; i++)
            Image.network(
              'https://picsum.photos/200/200?image=$i',
              loadingBuilder: (context, child, progress) {
                return progress == null ? child : CircularProgressIndicator();
              },
            ),
        ],
      ),
    );
  }
}
