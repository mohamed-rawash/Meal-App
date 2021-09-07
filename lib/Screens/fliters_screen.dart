import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  static const routName = 'filtrs_screen';



  @override
  State<StatefulWidget> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget buildSwitchListTile(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).primaryColor,
      inactiveTrackColor: Theme.of(context).accentColor,
      inactiveThumbColor: Colors.black,
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String,bool> currentFilters = Provider.of<MealProvider>(context, listen: true).filters;
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters', style: Theme.of(context).textTheme.title),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              "Adjust your Meal Selection.",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  'Gluten Free',
                  currentFilters['gluten'],
                  (newvalue) {
                    setState(() {
                      currentFilters['gluten'] = newvalue;
                    });
                    Provider.of<MealProvider>(context, listen: false).setFilter();
                  },
                ),
                buildSwitchListTile(
                  'Lactose Free',
                  currentFilters['lactose'],
                  (newvalue) {
                    setState(() {
                      currentFilters['lactose'] = newvalue;
                    });
                    Provider.of<MealProvider>(context, listen: false).setFilter();
                  },
                ),
                buildSwitchListTile(
                  'Vegan',
                  currentFilters['vegan'],
                  (newvalue) {
                    setState(() {
                      currentFilters['vegan'] = newvalue;
                    });
                    Provider.of<MealProvider>(context, listen: false).setFilter();
                  },
                ),
                buildSwitchListTile(
                  'Vegetarian',
                  currentFilters['vegetarian'],
                  (newvalue) {
                    setState(() {
                      currentFilters['vegetarian'] = newvalue;
                    });
                    Provider.of<MealProvider>(context, listen: false).setFilter();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
