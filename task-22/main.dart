import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (_) => const HomeScreen(),
      '/details': (_) => const DetailsScreen(),
      '/settings': (_) => const SettingsScreen(),
    },
  ));
}

// Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details',
                    arguments: "Hello from Home!");
              },
              child: const Text("Go to Details"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text("Go to Settings"),
            ),
          ],
        ),
      ),
    );
  }
}

// Details Screen
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(title: const Text("Details Screen")),
      body: Center(
        child: Text(
          args ?? "No data received",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Settings Screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings Screen")),
      body: const Center(
        child: Text(
          "Settings Page ⚙️",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
