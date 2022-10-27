import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Meal Detail'),),
      body: Center(child: Text('The Meal! - $mealId !'),),
    );
  }
}