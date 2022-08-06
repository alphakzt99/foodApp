

import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  List items = [];
  late int num;
  Tab1({Key? key, required items, required num}) : super(key: key);

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).primaryColor),
      child: Tab(
        icon: Icon(
          widget.items[widget.num],
          color: Theme.of(context).backgroundColor,
        ),
      ),
    );
  }
}

class Tab2 extends StatefulWidget {
  List items = [];
  String text = '';
  late int num;
  late double width;
  Tab2({Key? key, required items, required num, required text, required width})
      : super(key: key);

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(40)),
      width: widget.width,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tab(
              icon: Icon(
                widget.items[widget.num],
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
