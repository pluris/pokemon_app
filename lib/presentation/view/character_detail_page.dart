import 'package:flutter/material.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage(
      {super.key,
      required this.pokemon,
      required this.name,
      required this.url});

  final String pokemon;
  final String name;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
