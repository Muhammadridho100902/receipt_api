// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:receipt_api/modules/recipe.dart';
import 'package:receipt_api/modules/recipe_api.dart';
import 'package:receipt_api/view/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipe();
  }

  Future<void> getRecipe() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(
              width: 10,
            ),
            Text("Food Recipe"),
          ],
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                    title: _recipes[index].name,
                    cookTime: _recipes[index].totalTime,
                    rating: _recipes[index].ratings.toString(),
                    thumbnailUrl: _recipes[index].images);
              },
            ),
    );
  }
}
