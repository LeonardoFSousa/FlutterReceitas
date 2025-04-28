import 'package:flutter/material.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Map<String, dynamic> recipe;
  final Function(String)? onViewRecipe;

  const RecipeDetailsPage({Key? key, required this.recipe, this.onViewRecipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onViewRecipe != null && recipe['strMeal'] != null) {
      onViewRecipe!(recipe['strMeal']);
    }

    return Scaffold(
      appBar: AppBar(title: Text(recipe['strMeal'] ?? 'Detalhes')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe['strMealThumb'] != null)
              Image.network(recipe['strMealThumb'], height: 200),
            const SizedBox(height: 16),
            Text(
              recipe['strInstructions'] ?? 'Sem instruções disponíveis',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // <-- Correção aqui
                },
                child: const Text('Voltar ao Início'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
