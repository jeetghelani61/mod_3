import 'package:flutter/material.dart';

class Task20Screen extends StatefulWidget {
  const Task20Screen({super.key});

  @override
  State<Task20Screen> createState() => _Task20ScreenState();
}

class _Task20ScreenState extends State<Task20Screen> {
  final TextEditingController ctrl = TextEditingController();
  final List<Map<String, dynamic>> tasks = [];

  void addTask() {
    if (ctrl.text.isEmpty) return;
    setState(() {
      tasks.add({"title": ctrl.text, "done": false});
      ctrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 20: Task Manager")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: ctrl,
                    decoration:
                        const InputDecoration(labelText: "Enter task"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addTask,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return CheckboxListTile(
                    title: Text(
                      task["title"],
                      style: TextStyle(
                        decoration: task["done"]
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    value: task["done"],
                    onChanged: (v) {
                      setState(() {
                        task["done"] = v;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
