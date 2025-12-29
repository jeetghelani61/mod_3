import 'package:flutter/material.dart';

class Task28Screen extends StatelessWidget {
  const Task28Screen({super.key});

  final List<Map<String, dynamic>> products = const [
    {"name": "Laptop", "price": 500, "image": "https://picsum.photos/100/100?1"},
    {"name": "Phone", "price": 200, "image": "https://picsum.photos/100/100?2"},
    {"name": "Watch", "price": 100, "image": "https://picsum.photos/100/100?3"},
    {"name": "Camera", "price": 300, "image": "https://picsum.photos/100/100?4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 28: Product Listing")),
      body: SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            final p = products[index];
            return Container(
              width: 120,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(p["image"], width: 80, height: 80),
                  Text(p["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text("\$${p["price"]}"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
