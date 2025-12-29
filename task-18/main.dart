import 'package:flutter/material.dart';

class Task18Screen extends StatefulWidget {
  const Task18Screen({super.key});

  @override
  State<Task18Screen> createState() => _Task18ScreenState();
}

class _Task18ScreenState extends State<Task18Screen> {
  final nameCtrl = TextEditingController();
  final commentCtrl = TextEditingController();

  String category = "General";

  final categories = ["General", "Bug", "Suggestion", "Other"];

  @override
  void dispose() {
    nameCtrl.dispose();
    commentCtrl.dispose();
    super.dispose();
  }

  void submitFeedback() {
    if (nameCtrl.text.isEmpty || commentCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            "Feedback Submitted \nName: ${nameCtrl.text}\nCategory: $category"),
      ),
    );

    // Clear fields
    nameCtrl.clear();
    commentCtrl.clear();
    setState(() => category = "General");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 18: Feedback Form")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Name
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: "Name"),
            ),

            const SizedBox(height: 10),

            // Comments
            TextField(
              controller: commentCtrl,
              decoration: const InputDecoration(labelText: "Comments"),
              maxLines: 3,
            ),

            const SizedBox(height: 10),

            // Dropdown Category
            Row(
              children: [
                const Text("Category: "),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: category,
                  items: categories
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(c),
                          ))
                      .toList(),
                  onChanged: (v) {
                    setState(() => category = v!);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: submitFeedback,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
