import 'package:flutter/material.dart';
import 'package:food_app/my_flutter_app_icons.dart';

class Tab1 extends StatefulWidget {
  IconData number;
  Tab1({Key? key, required this.number}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: 70,
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(offset: Offset(5,5),blurRadius: 5,color: Theme.of(context).shadowColor),],
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).primaryColorLight),
      child: Tab(
        icon: Icon(
          widget.number,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class Tab2 extends StatefulWidget {
  String text;
  IconData number;
  double width;
  Tab2(
      {Key? key, required this.number,required this.text,required this.width})
      : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        boxShadow: [BoxShadow(offset: Offset(5,5),blurRadius: 5,color: Theme.of(context).shadowColor),],
          border: Border.all(color: Theme.of(context).backgroundColor),
          borderRadius: BorderRadius.circular(20)),
      width: widget.width,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Tab(
              icon: Icon(
                widget.number,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(widget.text,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                )),
          )
        ],
      ),
    );
  }
}
