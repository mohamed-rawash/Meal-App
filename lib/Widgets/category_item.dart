import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Screens/category_meals_screen.dart';



class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx)
  {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,

    arguments: {
      'id':id,
      'title':title,
    },

    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
        borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Container(
        alignment: Alignment.center,
        padding:EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
         gradient: LinearGradient(
           colors: [
             color.withOpacity(0.6),
             color,
           ],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,
         ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
