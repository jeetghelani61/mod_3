import 'package:flutter/material.dart';

class Task17Screen extends StatefulWidget {
  const Task17Screen({super.key});

  @override
  State<Task17Screen> createState() => _Task17ScreenState();
}

class _Task17ScreenState extends State<Task17Screen> {
  final _formKey = GlobalKey<FormState>();

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    phoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task 17: Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Name
              TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter your name" : null,
              ),

              // Email
              TextFormField(
                controller: emailCtrl,
                decoration: const InputDecoration(labelText: "Email"),
                keyboardType: TextInputType.emailAddress,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Enter email";
                  }
                  if (!v.contains('@') || !v.contains('.')) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),

              // Password
              TextFormField(
                controller: passCtrl,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Enter password";
                  }
                  if (v.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              // Phone
              TextFormField(
                controller: phoneCtrl,
                decoration: const InputDecoration(labelText: "Phone"),
                keyboardType: TextInputType.phone,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "Enter phone number";
                  }
                  if (v.length < 10) {
                    return "Enter valid phone number";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Registration Successful ✅"),
                      ),
                    );
                  }
                },
                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
