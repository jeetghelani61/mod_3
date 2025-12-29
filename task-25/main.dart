import 'package:flutter/material.dart';

class Task25Screen extends StatefulWidget {
  const Task25Screen({super.key});

  @override
  State<Task25Screen> createState() => _Task25ScreenState();
}

class _Task25ScreenState extends State<Task25Screen> {
  final ctrl = TextEditingController();
  final List<String> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 25: To-Do List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: ctrl, decoration: const InputDecoration(labelText: "Add task")),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (ctrl.text.isEmpty) return;
                    setState(() {
                      tasks.add(ctrl.text);
                      ctrl.clear();
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(tasks[index]),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState(() => tasks.removeAt(index));
                  },
                  child: ListTile(title: Text(tasks[index])),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
