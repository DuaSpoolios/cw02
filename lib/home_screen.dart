import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recipes;
  final Function(int) onToggleFavorite;

  const HomeScreen({
    super.key,
    required this.recipes,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Book'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(recipe['name']),
              trailing: Icon(
                recipe['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                color: recipe['isFavorite'] ? Colors.red : null,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: {'recipe': recipe, 'index': index},
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.orange,
        icon: const Icon(Icons.star),
        label: const Text("View Favorites"),
        onPressed: () => Navigator.pushNamed(context, '/favorites'),
      ),
    );
  }
}
