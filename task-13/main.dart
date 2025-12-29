import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ImageScreen());
  }
}

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String currentImage = 'https://picsum.photos/300/200';

  void changeImage() {
    setState(() {
      currentImage = 'https://picsum.photos/300/200?random=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task 13')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(currentImage, width: 300, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeImage,
              child: Text('Change Image'),
            ),
          ],
        ),
      ),
    );
  }
}
