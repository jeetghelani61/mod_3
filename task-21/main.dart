import 'package:flutter/material.dart';

class Task21Screen extends StatelessWidget {
  const Task21Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 21: Two-Screen App")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SecondScreen(),
              ),
            );
          },
          child: const Text("Go to Second Screen"),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Screen")),
      body: const Center(
        child: Text(
          "Welcome to the Second Screen! ",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
