import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hoc_flutter/chapter2/components/recipe_thumbnail.dart';
import 'package:hoc_flutter/chapter2/models/simple_recipe.dart';

class RecipesGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipesGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.builder(
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),//SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500),
        itemBuilder: (context, index){
          final simpleRecipe = recipes[index];
          return RecipeThumbnail(recipe: simpleRecipe);
        }
      ),
    );
  }
}