import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;

  const FavoritesScreen({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Recipes'),
        backgroundColor: Colors.orange,
      ),
      body: recipes.isEmpty
          ? const Center(
              child: Text('No favorites yet!'),
            )
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(recipe['name']),
                    subtitle: Text(recipe['ingredients']),
                  ),
                );
              },
            ),
    );
  }
}
