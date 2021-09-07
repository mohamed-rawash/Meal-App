import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Screens/fliters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    BuildContext context,
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      leading: Icon(
        icon,
        color: CupertinoColors.black,
        size: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          buildListTile(
            context,
            "Meal",
            Icons.restaurant,
              (){Navigator.of(context).pushReplacementNamed('/');},
          ),
          buildListTile(
            context,
            "Filters",
            Icons.filter_vintage_rounded,
                (){Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);},
          ),
        ],
      ),
    );
  }
}
