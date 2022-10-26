import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        appBar: AppBar (title: const Text("The Recipes"),),
        body: const Center(
          child: Text('The Recipes For the Category!'),
        ));
  }
}
