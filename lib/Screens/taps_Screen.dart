import 'package:flutter/material.dart';
import 'package:meal_app/Screens/categories_screen.dart';
import 'package:meal_app/Screens/favorite_screen.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

class TapsScreen extends StatefulWidget {

  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
   List<Map<String, Object>> pages ;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false).getData();
    pages=[
      {
        'page': CategoriesScreen(),
        'title': "Categories",
      },
      {
        'page': FavoriteScreen(),
        'title': "My Favorite",
      },
    ];
    super.initState();
  }

  void _selectPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[_selectedPageIndex]['title'],style: Theme.of(context).textTheme.title,),
      ),
      body:pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
