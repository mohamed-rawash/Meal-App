import 'package:flutter/material.dart';
import 'package:meal_app/Moduls/category.dart';
import 'package:meal_app/Moduls/meal.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dummy_data.dart';
class MealProvider with ChangeNotifier{
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];
  List<String> prefsId = [];
  List<Category> availableCategory = [];

  void setFilter() async{
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();

      List<Category> ac = [];
      availableMeals.forEach((meal) {
        meal.categories.forEach((catId) {
          DUMMY_CATEGORIES.forEach((cat) {
            if(cat.id == catId){
              if(!ac.any((cat) => cat.id == catId)) ac.add(cat);
            }
          });
        });
      });
      availableCategory = ac;

      notifyListeners();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("gluten", filters['gluten']);
      prefs.setBool("lactose", filters['lactose']);
      prefs.setBool("vegan", filters['vegan']);
      prefs.setBool("vegetarian", filters['vegetarian']);
  }

  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    filters['gluten'] = prefs.getBool("gluten")?? false;
    filters['lactose'] = prefs.getBool("lactose")?? false;
    filters['vegan'] = prefs.getBool("vegan")?? false;
    filters['vegetarian'] = prefs.getBool("vegetarian")?? false;
    prefsId = prefs.getStringList("prefsId")?? [];
    for (var mealId in prefsId){
      final existingindex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
      if(existingindex < 0){
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      }
    }
    notifyListeners();
  }

  void toggleFavorite(String mealId) async {

    final existingindex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingindex >= 0) {
        favoriteMeals.removeAt(existingindex);
        prefsId.remove(mealId);
    } else {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
        prefsId.add(mealId);
    }
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("prefsId", prefsId);
  }

  bool isMealFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }
}