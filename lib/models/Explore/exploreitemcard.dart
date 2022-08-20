import 'package:flutter/material.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';

class CardExplore extends StatefulWidget {
  const CardExplore({Key? key}) : super(key: key);

  @override
  State<CardExplore> createState() => _CardExploreState();
}

class _CardExploreState extends State<CardExplore> {
  int index1 = 7;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: index1,
        itemBuilder: ((context, index) => Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Theme.of(context).shadowColor,
            child: Container(
              margin: EdgeInsets.all(8),
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [cardData[0], cardData[1], cardData[2]],
              ),
            ))));
  }
}

List cardData = [
  Padding(
    padding: EdgeInsets.all(8),
    child: Image.asset('lib/assets/cake.png'),
  ),
  Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          "Banh Mi",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      IconButton(
          padding: EdgeInsets.only(left: 120),
          onPressed: () {},
          icon: Icon(MyFlutterApp.favorite_border))
    ],
  ),
  Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Text("1.4 km. 20 min. \$3.55 delivery fee"),
  )
];
