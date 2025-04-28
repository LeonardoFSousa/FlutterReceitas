import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe_details_page.dart';
import 'login_page.dart'; // ADICIONE ESSA IMPORTAÇÃO AQUI

class RecipesPage extends StatefulWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  List<dynamic> recipes = [];
  TextEditingController searchController = TextEditingController();
  List<String> recentRecipes = [];

  Future<void> fetchRecipes(String query) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=$query'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        recipes = data['meals'] ?? [];
      });
    }
  }

  void addRecentRecipe(String recipeName) {
    setState(() {
      recentRecipes.insert(0, recipeName);
      if (recentRecipes.length > 5) {
        recentRecipes = recentRecipes.sublist(0, 5);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterReceitas - Receitas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Buscar receita...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => fetchRecipes(searchController.text),
                ),
              ),
            ),
          ),
          if (recentRecipes.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Últimas Receitas Vistas:',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ...recentRecipes.map((name) => ListTile(title: Text(name))),
            const Divider(),
          ],
          Expanded(
            child: recipes.isEmpty
                ? const Center(child: Text('Nenhuma receita encontrada'))
                : ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = recipes[index];
                      return ListTile(
                        title: Text(recipe['strMeal'] ?? 'Sem Nome'),
                        leading: recipe['strMealThumb'] != null
                            ? Image.network(recipe['strMealThumb'],
                                width: 50, height: 50, fit: BoxFit.cover)
                            : const Icon(Icons.fastfood),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RecipeDetailsPage(
                                recipe: recipe,
                                onViewRecipe: (name) => addRecentRecipe(name),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
