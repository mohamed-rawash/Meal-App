import 'package:flutter/material.dart';
import 'package:meal_app/Screens/fliters_screen.dart';
import 'package:meal_app/Screens/meal_detail_screen.dart';
import 'package:meal_app/Screens/taps_Screen.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/categories_screen.dart';
import 'Screens/category_meals_screen.dart';
import 'package:provider/provider.dart';


import 'main_splash_screen.dart';

void main(){
  runApp(ChangeNotifierProvider<MealProvider>(
    create: (ctx) => MealProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(200, 224, 180, 1),
        fontFamily: 'Raleway',
        buttonColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                fontSize: 17,
                fontFamily: 'Raleway',
                color: Colors.white,
              ),
              body2: TextStyle(
                fontSize: 18,
                fontFamily: 'Raleway',
                color: Colors.black,
              ),
              title: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Raleway'),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TapsScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(),
        FiltersScreen.routName: (context) =>
            FiltersScreen(),
      },
    );
  }
}

