import 'package:flutter/material.dart';

class InfiniteListScreen extends StatefulWidget {
  const InfiniteListScreen({super.key});

  @override
  State<InfiniteListScreen> createState() => _InfiniteListScreenState();
}

class _InfiniteListScreenState extends State<InfiniteListScreen> {
  List<int> items = List.generate(20, (index) => index + 1); // Initial 20 items
  final ScrollController _controller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent &&
          !isLoading) {
        _loadMore();
      }
    });
  }

  void _loadMore() async {
    setState(() => isLoading = true);

    // Simulate delay (like fetching from server)
    await Future.delayed(const Duration(seconds: 1));

    final last = items.last;
    setState(() {
      items.addAll(List.generate(10, (index) => last + index + 1));
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Infinite Scrolling List")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: items.length + 1, // extra item for loading indicator
              itemBuilder: (context, index) {
                if (index == items.length) {
                  return isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }
                return ListTile(title: Text("Item ${items[index]}"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
