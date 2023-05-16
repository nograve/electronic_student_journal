import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Electronic journal'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Subjects'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Kek'),
          ),
        ],
      ),
    );
  }
}
