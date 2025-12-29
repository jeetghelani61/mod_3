import 'package:flutter/material.dart';

void main() => runApp(StyledTextScreen());

class StyledTextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 32,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'To Flutter World',
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
