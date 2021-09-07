import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meal_detail_screen';





  Widget buildScetionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //margin: EdgeInsets.only(top: 10),
              //padding: EdgeInsets.only(top: 10,bottom: 10),
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildScetionTitle(context, "Ingredients"),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(color: Theme.of(context).canvasColor),
                  borderRadius: BorderRadius.circular(15)),
              height: 300,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      selectedMeal.ingrdeients[index],
                      style: Theme.of(context).textTheme.body1,
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 50,
                      endIndent: 50,
                      thickness: 1,
                    ),
                  ],
                ),
                itemCount: selectedMeal.ingrdeients.length,
              ),
            ),
            buildScetionTitle(context, "Steps"),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all(color: Theme.of(context).canvasColor),
                  borderRadius: BorderRadius.circular(15)),
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("#${index + 1}"),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                        style: Theme.of(context).textTheme.body1,
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 50,
                      endIndent: 20,
                      thickness: 1,
                    )
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        splashColor: Colors.white,
        child: Icon(
          Provider.of<MealProvider>(context, listen: true).isMealFavorite(mealID)? Icons.star : Icons.star_border,
          color: Colors.black,
          size: 24,
        ),
        onPressed: ()=> Provider.of<MealProvider>(context, listen: false).toggleFavorite(mealID),
      ),
    );
  }
}
