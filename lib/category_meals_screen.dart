import 'package:flutter/material.dart';
import 'dummy_data.dart';

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
    final categoryMeal = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(itemBuilder: (ctx, index) {
            return Text(categoryMeal[index].title);
          },itemCount: categoryMeal.length,),
        );
  }
}
