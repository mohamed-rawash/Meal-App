import 'package:flutter/material.dart';
import 'package:meal_app/Moduls/meal.dart';
import 'package:meal_app/Widgets/meal_item.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'categroy_meals';




  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> disPlayedMeal;

  @override
  void didChangeDependencies() {
    List<Meal> availableMeals = Provider.of<MealProvider>(context).availableMeals;
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryID = routeArg['id'];
    categoryTitle = routeArg['title'];
    disPlayedMeal =availableMeals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      disPlayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool is_landscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          childAspectRatio:is_landscape? 2.4/2: 2.65/2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemBuilder: (ctx, index) {
          return MealItem(
            id: disPlayedMeal[index].id,
            imageUrl: disPlayedMeal[index].imageUrl,
            title: disPlayedMeal[index].title,
            duration: disPlayedMeal[index].duration,
            complexity: disPlayedMeal[index].complexity,
            affordability: disPlayedMeal[index].affordability,

          );
        },
        itemCount: disPlayedMeal.length,
      ),
    );
  }
}
