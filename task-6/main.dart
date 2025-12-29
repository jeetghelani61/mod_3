import 'package:flutter/material.dart';

void main() => runApp(ProfileCard());

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 8,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                ),
                SizedBox(height: 20),
                Text(
                  'John Doe',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Passionate about mobile development and creating beautiful user interfaces with Flutter.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.phone),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
