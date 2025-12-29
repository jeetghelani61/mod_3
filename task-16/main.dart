import 'dart:async';
import 'package:flutter/material.dart';

class Task16Screen extends StatefulWidget {
  const Task16Screen({super.key});

  @override
  State<Task16Screen> createState() => _Task16ScreenState();
}

class _Task16ScreenState extends State<Task16Screen> {
  final PageController _controller = PageController();

  final List<String> images = [
    "https://picsum.photos/id/101/500/300",
    "https://picsum.photos/id/102/500/300",
    "https://picsum.photos/id/103/500/300",
  ];

  int currentIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      currentIndex = (currentIndex + 1) % images.length;
      _controller.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 16")),
      body: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
