import 'package:flutter/material.dart';

class CardExplore extends StatefulWidget {
  CardExplore({Key? key}) : super(key: key);

  @override
  State<CardExplore> createState() => _CardExploreState();
}

class _CardExploreState extends State<CardExplore> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: ((context, index) => Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            shadowColor: Theme.of(context).shadowColor,
            child: Column(
              children: [
                
              ],
            ))));
  }
}
