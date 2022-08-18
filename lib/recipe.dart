class Recipe {
  int servings;
  List<Ingredient> ingredients;
  String label;
  String imgUrl;

  Recipe(this.label, this.imgUrl, this.servings, this.ingredients);
}
class Ingredient {
  double quantity;
  String measure;
  String name;

  Ingredient(this.quantity, this.measure, this.name);
}