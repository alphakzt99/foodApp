import 'package:flutter/material.dart';
import 'package:food_app/models/Explore/Offers.dart';
import 'package:food_app/models/Explore/exploreitemcard.dart';
import 'package:food_app/my_flutter_app_icons1.dart';

class Scroll extends StatefulWidget {
  TabController controller;
  Scroll({Key? key, required this.controller}) : super(key: key);

  @override
  State<Scroll> createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: size.width, height: size.height * 0.2, child: Offers()),
      Container(
        height: size.height * 0.47,
        width: size.width,
        child: TabBarView(
          controller: widget.controller,
          children: [
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
            CardExplore(),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "More",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor),
            ),
          ),
          SizedBox(
            width: size.width * 0.6,
          ),
          IconButton(
              splashRadius: 20.0,
              splashColor: Theme.of(context).backgroundColor,
              onPressed: () {},
              icon: Icon(
                MyFlutterApp1.right_big,
                color: Theme.of(context).backgroundColor,
              ))
        ]),
      ),
      
    ]);
  }
}
