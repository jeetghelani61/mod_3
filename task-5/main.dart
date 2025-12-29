import 'package:flutter/material.dart';

void main() => runApp(RowLayout());

class RowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            color: Colors.red,
            width: 100,
            height: double.infinity,
            child: Center(child: Text('Red')),
          ),
          Container(
            color: Colors.green,
            width: 150,
            height: double.infinity,
            child: Center(child: Text('Green')),
          ),
          Container(
            color: Colors.blue,
            width: 200,
            height: double.infinity,
            child: Center(child: Text('Blue')),
          ),
        ],
      ),
    );
  }
}
