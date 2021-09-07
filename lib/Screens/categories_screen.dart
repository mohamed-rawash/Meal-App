import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/category_item.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title:Text("Meals",style: Theme.of(context).textTheme.title,),),
      body: GridView(
        padding: EdgeInsets.all(25),
        children:Provider.of<MealProvider>(context).availableCategory.map((catData) =>
           CategoryItem(catData.id,catData.title,catData.color),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),

    );
  }
}