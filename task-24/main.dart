import 'package:flutter/material.dart';

class Task24Screen extends StatefulWidget {
  const Task24Screen({super.key});

  @override
  State<Task24Screen> createState() => _Task24ScreenState();
}

class _Task24ScreenState extends State<Task24Screen> {
  int currentIndex = 0;

  final screens = [
    const Center(child: Text("News Screen", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Messages Screen", style: TextStyle(fontSize: 24))),
    const Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 24: Bottom Nav")),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
