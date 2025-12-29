import 'package:flutter/material.dart';

class Task19Screen extends StatefulWidget {
  const Task19Screen({super.key});

  @override
  State<Task19Screen> createState() => _Task19ScreenState();
}

class _Task19ScreenState extends State<Task19Screen> {
  final List<String> items = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Pineapple",
    "Grapes",
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = items
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Task 19: Search Bar")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: "Search",
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(filtered[index]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
