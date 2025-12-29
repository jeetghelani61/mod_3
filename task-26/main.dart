import 'package:flutter/material.dart';

class Task26Screen extends StatefulWidget {
  const Task26Screen({super.key});

  @override
  State<Task26Screen> createState() => _Task26ScreenState();
}

class _Task26ScreenState extends State<Task26Screen> {
  final ScrollController _controller = ScrollController();
  final List<int> items = List.generate(20, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent) {
        setState(() {
          final last = items.last;
          items.addAll(List.generate(10, (index) => last + index + 1));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 26: Infinite List")),
      body: ListView.builder(
        controller: _controller,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text("Item ${items[index]}"));
        },
      ),
    );
  }
}
