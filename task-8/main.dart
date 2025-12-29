import 'package:flutter/material.dart';

void main() => runApp(NameList());

class NameList extends StatelessWidget {
  final List<String> names = [
    'Alice', 'Bob', 'Charlie', 'Diana', 'Eve',
    'Frank', 'Grace', 'Henry', 'Ivy', 'Jack'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Names List')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            leading: CircleAvatar(
              child: Text(names[index][0]),
            ),
            onTap: () {
              print('${names[index]} tapped');
            },
          );
        },
      ),
    );
  }
}
