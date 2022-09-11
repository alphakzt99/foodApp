import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
import 'package:food_app/models/Explore/Tab1.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';
import 'package:ternav_icons/ternav_icons.dart';

class CardExplore extends StatefulWidget {
  var rating;
  CardExplore({Key? key, required this.rating}) : super(key: key);

  @override
  State<CardExplore> createState() => _CardExploreState();
}

class _CardExploreState extends State<CardExplore> {
  int index1 = 7;
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    List cardData = [
      Container(
        width: 200,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Center(
          child: Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('lib/assets/cake.png')),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 10,
            left: 5
          ),
          child: RichText(
            
            text: TextSpan(children: [
              TextSpan(
                  text: 'Walgreens\n',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      fontFamily: font)),
              TextSpan(
                  text: 'Fresh and tasty',
                  style: TextStyle(
                      fontSize: 12, color: Colors.white70, fontFamily: font))
            ]),
          )),
  
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: RichText(
              textAlign: TextAlign.start,
              textScaleFactor: 1.2,
              text: TextSpan(children: [
                TextSpan(
                    text: "\$ ",
                    style: TextStyle(color: Theme.of(context).primaryColorLight)),
                TextSpan(
                    text: "3.55",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontFamily: font))
              ]),
            ),
          ),
       Container(
            width: 180,
            height: 45,
            margin: EdgeInsets.only(bottom: 0,top: 10),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(15)),
            child: 
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              TernavIcons.bold.star,
              color: Theme.of(context).primaryColorLight,
            ),
            RichText(
                textScaleFactor: 1.2,
                text: TextSpan(children: [
                  TextSpan(
                      text: " ${widget.rating}",
                      style: TextStyle(
                          fontFamily: font, fontWeight: FontWeight.bold,color: Theme.of(context).backgroundColor))
                ]))
          ],
        ),
      )
          
      
    ];
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: index1,
        itemBuilder: ((context, index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(8, 8),
                      blurRadius: 8,
                      color: Theme.of(context).shadowColor)
                ],
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).primaryColor),
            child: Column(
              children: [
                cardData[0],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [cardData[1], cardData[2],cardData[3]],
                ),
              ],
            ))));
  }
}
