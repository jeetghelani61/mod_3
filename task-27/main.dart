import 'package:flutter/material.dart';

class Task27Screen extends StatefulWidget {
  const Task27Screen({super.key});

  @override
  State<Task27Screen> createState() => _Task27ScreenState();
}

class _Task27ScreenState extends State<Task27Screen> {
  final List<String> items = ["Apple", "Banana", "Mango", "Orange"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 27: Custom List")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.food_bank),
            title: Text(items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() => items.removeAt(index));
              },
            ),
          );
        },
      ),
    );
  }
}
