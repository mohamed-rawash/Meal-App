import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Moduls/meal.dart';
import 'package:meal_app/Screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;


  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;

      case Complexity.Challenging:
        return 'Challenging';
        break;

      case Complexity.Hard:
        return 'Hard';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;

      case Affordability.Pricey:
        return 'Pricey';
        break;

      case Affordability.Luxurious:
        return 'Luxurious';
        break;

      default:
        return 'Unknown';
        break;
    }
  }

  void selectMeal(BuildContext ctx) {

    Navigator.pushNamed(ctx, MealDetailScreen.routeName,
    arguments:id ,
    ).then((result){
      //if(result != null)
       // removeItem(result);
    });

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 15,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    width: 200,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.body1,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text("$duration min",style: Theme.of(context).textTheme.body1,),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text("$complexityText",style: Theme.of(context).textTheme.body1,),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text("$affordabilityText"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
