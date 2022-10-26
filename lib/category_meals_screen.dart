import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/category-meals';
  // final String CategoryId ;
  // final String CategoryTitle ;
  //
  // CategoryMealsScreen(this.CategoryId, this.CategoryTitle);

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final String? categoryId = routArgs['id'];
    final String? categoryTitle = routArgs['title'];
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: const Center(
          child: Text('The Recipes For the Category!'),
        ));
  }
}
