import 'package:daily_meal/models/meal.dart';
import 'package:daily_meal/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routName = '/category-meals';
  final List<Meal> availableMeal;
  CategoryMealsScreen(this.availableMeal);

  // final String CategoryId ;
  // final String CategoryTitle ;
  //
  // CategoryMealsScreen(this.CategoryId, this.CategoryTitle);
  @override
  _CategoryMealScreen createState() => _CategoryMealScreen();

}

class _CategoryMealScreen extends State<CategoryMealsScreen>{

  late String categoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(!_loadedInitData){
      final routArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final String? categoryId = routArgs['id'];
      categoryTitle = routArgs['title'] as String;
      displayedMeals = widget.availableMeal.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }

}
