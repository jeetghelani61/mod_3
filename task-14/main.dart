import 'package:flutter/material.dart';

class Task13Screen extends StatefulWidget {
  const Task13Screen({super.key});

  @override
  State<Task13Screen> createState() => _Task13ScreenState();
}

class _Task13ScreenState extends State<Task13Screen> {
  final List<String> images = [
    "https://picsum.photos/id/1015/400/300",
    "https://picsum.photos/id/1025/400/300",
    "https://picsum.photos/id/1035/400/300",
  ];

  int index = 0;

  void changeImage() {
    setState(() {
      index = (index + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 13")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(images[index], height: 250),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeImage,
            child: const Text("Change Image"),
          ),
        ],
      ),
    );
  }
}
