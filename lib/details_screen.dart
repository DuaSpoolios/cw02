import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final int index;
  final Function(int) onToggleFavorite;

  const DetailsScreen({
    super.key,
    required this.recipe,
    required this.index,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:',
                style: Theme.of(context).textTheme.titleMedium),
            Text(recipe['ingredients']),
            const SizedBox(height: 20),
            Text('Instructions:',
                style: Theme.of(context).textTheme.titleMedium),
            Text(recipe['instructions']),
            const Spacer(),
            Center(
              child: ElevatedButton.icon(
                icon: Icon(
                  recipe['isFavorite']
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                label: Text(
                  recipe['isFavorite']
                      ? 'Remove from Favorites'
                      : 'Add to Favorites',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                onPressed:() {
                  onToggleFavorite(index);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
