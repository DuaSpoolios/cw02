import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

void main() {
  runApp(const RecipeBookApp());
}

class RecipeBookApp extends StatefulWidget {
  const RecipeBookApp({super.key});

  @override
  State<RecipeBookApp> createState()=> _RecipeBookAppState();
}
class _RecipeBookAppState extends State<RecipeBookApp> {
  final List<Map<String, dynamic>> recipes = [
    {
      'name': 'Spaghetti Carbonara',
      'ingredients': 'Spaghetti, Eggs, Parmesan, Pancetta, Black Pepper',
      'instructions': 'Cook spaghetti. Fry pancetta. Mix eggs with cheese, then combine all.',
      'isFavorite': false,
    },
    {
      'name': 'Chicken Biryani',
      'ingredients': 'Rice, Chicken, Yogurt, Spices, Fried Onions',
      'instructions': 'Cook rice and chicken separately, then layer and steam together.',
      'isFavorite': false,
    },
    {
      'name': 'Chocolate Cake',
      'ingredients': 'Flour, Cocoa, Sugar, Eggs, Butter',
      'instructions': 'Mix ingredients, bake at 350°F for 30 mins.',
      'isFavorite': false,
    },
  ];

  void toggleFavorite(int index) {
    setState(() {
      recipes[index]['isFavorite']= !recipes[index]['isFavorite'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe Book',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      home: HomeScreen(
        recipes: recipes,
        onToggleFavorite: toggleFavorite,
      ),
      routes: {
        '/favorites': (context)=> FavoritesScreen(
              recipes: recipes.where((r) => r['isFavorite']).toList(),
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name== '/details') {
          final args= settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context)=> DetailsScreen(
              recipe: args['recipe'],
              index: args['index'],
              onToggleFavorite: toggleFavorite,
            ),
          );
        }
        return null;
      },
    );
  }
}
