import 'package:flutter/material.dart';
import 'package:meal_app/Moduls/meal.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
 class FavoriteScreen extends StatelessWidget {


  @override
   Widget build(BuildContext context) {
    List<Meal> favoriteMeals = Provider.of<MealProvider>(context, listen: true).favoriteMeals;
    if(favoriteMeals.isEmpty)
    {
      return Center(
        child: Text("You have no favorite yet",style: Theme.of(context).textTheme.title,),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            imageUrl: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }

   }
 }
