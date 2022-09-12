import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../main.dart';

class exploreList extends StatefulWidget {
  final double width;
  final double height;
  var size;
  exploreList({
    required this.width,
    required this.height,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  State<exploreList> createState() => _exploreListState();
}

class _exploreListState extends State<exploreList> {
  var pressed = false;
  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();
    List cardData = [
      Container(
        width: 150,
        height: widget.height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
            ),
        child: Center(
          child: Container(
            width: 130,
            height: widget.height -20,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(4,4),
                  blurRadius: 4,
                  color: Theme.of(context).shadowColor
                )
              ],
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('lib/assets/search.png')),
              borderRadius: BorderRadius.circular(15))),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:  EdgeInsets.only(left:widget.size*0.034,top: 20, bottom: 10,right: widget.size*0.135),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Walgreens\n',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          fontFamily: font)),
                  TextSpan(
                      text: 'Fresh and tasty',
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).primaryColor,
                          fontFamily: font))
                ]),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: RichText(
              textScaleFactor: 1.2,
              text: TextSpan(children: [
                  TextSpan(text: "\$ ",style: TextStyle(color: Theme.of(context).primaryColor)),
                  TextSpan(
                      text: "3.55",
                      style:
                          TextStyle(color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold, fontFamily: font))
              ]),
            ),
                ),
            Container(
              width: 35,
              height: 35,
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    
                  },
                  icon: Icon(
                    TernavIcons.lightOutline.heart,
                    color: Theme.of(context).backgroundColor,
                  )),
            )
              ],
            ),
          )
        ],
      ),
      
    ];
    return ListView.builder(
        controller: controller,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Container(
              width: widget.width,
              height: widget.height,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(8, 8),
                        blurRadius: 8,
                        color: Theme.of(context).shadowColor)
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).backgroundColor),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [cardData[0], cardData[1]],
                  ),
                ],
              ));
        }));
  }
}
