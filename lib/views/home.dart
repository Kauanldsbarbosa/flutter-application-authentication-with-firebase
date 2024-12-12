import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: TextButton(
            onPressed: () => context.go('/login'),
            child: const Text("To login")),
      ),
      appBar: AppBar(),
      body: TextButton(onPressed: () async {}, child: const Text("data")),
    );
  }
}
