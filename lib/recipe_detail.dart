import 'package:flutter/material.dart';
import 'package:hoc_flutter/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeDetail> createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(widget.recipe.label)),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.recipe.imgUrl)),
            ),
            const SizedBox(height: 4,),
            Text(widget.recipe.label,style: const TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingradient = widget.recipe.ingredients[index];
                  return Text('${ingradient.quantity * _sliderVal} ${ingradient.measure} ${ingradient.name}');
                }
              )
            ),
            Slider(
              min: 1,
              max: 10,
              label: '${_sliderVal * widget.recipe.servings} servings',
              value: _sliderVal.toDouble(),
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round();
                });
              },
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}