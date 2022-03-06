import 'dart:convert';
import 'package:receipt_api/modules/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var url = Uri.https("yummly2.p.rapidapi.com", '/feeds/list',
        {'limit': '18', 'start': '0', 'tag': 'list.recipe.popular'});

    final response = await http.get(url, headers: {
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '65ed9e75f9msh5a9bd2c0052733dp1f9f5ejsne6b629cd7fe2',
      'useQueryString': 'true',
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']){
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
