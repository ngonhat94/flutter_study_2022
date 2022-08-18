import 'package:flutter/material.dart';
import 'package:hoc_flutter/chapter2/api/mock_fooderlich_service.dart';
import 'package:hoc_flutter/chapter2/components/recipes_grid_view.dart';
import 'package:hoc_flutter/chapter2/models/simple_recipe.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  
  RecipeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: (context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return RecipesGridView(recipes: snapshot.data ?? []);
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );  
  }
}