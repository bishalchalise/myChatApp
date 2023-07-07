import 'package:flutter/material.dart';
import 'package:mychat/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logOut() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signOut();
    } catch (e) {
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: ${e.toString()}"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: logOut, icon: const Icon(Icons.logout))],
      ),
      body: const Center(
        child: Text("HomePage"),
      ),
    );
  }
}
