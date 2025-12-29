import 'package:flutter/material.dart';

class Task15Screen extends StatelessWidget {
  const Task15Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 15")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("BoxFit.cover"),
          Container(
            height: 150,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/images/sample.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),
          const Text("BoxFit.contain"),
          Container(
            height: 150,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/images/sample.jpg",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          const Text("BoxFit.fill"),
          Container(
            height: 150,
            color: Colors.grey[300],
            child: Image.asset(
              "assets/images/sample.jpg",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
