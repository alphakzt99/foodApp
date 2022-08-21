import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/models/Explore/Tab1.dart';
import 'package:food_app/models/Explore/exploreitemcard.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';

class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  List items = [
    MyFlutterApp.local_grocery_store,
    MyFlutterApp.local_dining,
    MyFlutterApp.local_bar,
    MyFlutterApp.hamburger,
    MyFlutterApp.free_breakfast,
    MyFlutterApp.ice_cream,
    MyFlutterApp.mug_hot,
    MyFlutterApp1.fish,
    MyFlutterApp1.apple_alt,
    MyFlutterApp1.beer,
    MyFlutterApp.cheese,
    MyFlutterApp.leaf
  ];

  late TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: items.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                InkWell(
                  onTap: () => Drawer(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).primaryColor,
                            ),
                            height: 4,
                            width: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).primaryColor,
                            ),
                            height: 4,
                            width: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).primaryColor,
                            ),
                            height: 4,
                            width: 15,
                          )
                        ]),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Get your food",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      "Delivered ASAP!",
                      style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              DefaultTabController(
                length: items.length,
                initialIndex: 0,
                child: TabBar(
                    onTap: (value) {
                      setState(() {
                        _controller.index = value;
                      });
                    },
                    indicatorWeight: 0.5,
                    indicatorColor: Theme.of(context).backgroundColor,
                    isScrollable: true,
                    controller: _controller,
                    tabs: [
                      _controller.index == 0
                          ? Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 5,
                                        color: Theme.of(context).shadowColor),
                                  ],
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: BorderRadius.circular(20)),
                              width: 100,
                              height: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Tab(
                                      icon: Icon(
                                        items[0],
                                        color:
                                            Theme.of(context).backgroundColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text("All",
                                        style: TextStyle(
                                          color:
                                              Theme.of(context).backgroundColor,
                                        )),
                                  )
                                ],
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: 70,
                              height: 100,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(5, 5),
                                        blurRadius: 5,
                                        color: Theme.of(context).shadowColor),
                                  ],
                                  border: Border.all(
                                      color: Theme.of(context).backgroundColor),
                                  borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).backgroundColor),
                              child: Tab(
                                icon: Icon(
                                  items[0],
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                      _controller.index == 1
                          ? Tab1(number: items[1])
                          : Tab2(
                              number: items[1],
                              text: "Dining",
                              width: 110,
                            ),
                      _controller.index == 2
                          ? Tab1(number: items[2])
                          : Tab2(
                              number: items[2],
                              text: "Soft Drinks",
                              width: 110,
                            ),
                      _controller.index == 3
                          ? Tab1(number: items[3])
                          : Tab2(
                              number: items[3],
                              text: "Bakery",
                              width: 110,
                            ),
                      _controller.index == 4
                          ? Tab1(number: items[4])
                          : Tab2(
                              number: items[4],
                              text: "Drinks",
                              width: 110,
                            ),
                      _controller.index == 5
                          ? Tab1(number: items[5])
                          : Tab2(
                              number: items[5],
                              text: "Dessert",
                              width: 110,
                            ),
                      _controller.index == 6
                          ? Tab1(number: items[6])
                          : Tab2(
                              number: items[6],
                              text: "Cafe",
                              width: 110,
                            ),
                      _controller.index == 7
                          ? Tab1(number: items[7])
                          : Tab2(
                              number: items[7],
                              text: "Seafood",
                              width: 120,
                            ),
                      _controller.index == 8
                          ? Tab1(number: items[8])
                          : Tab2(
                              number: items[8],
                              text: "Fruit",
                              width: 120,
                            ),
                      _controller.index == 9
                          ? Tab1(number: items[9])
                          : Tab2(
                              number: items[9],
                              text: "Alcohol",
                              width: 120,
                            ),
                      _controller.index == 10
                          ? Tab1(number: items[10])
                          : Tab2(
                              number: items[10],
                              text: "Cake",
                              width: 110,
                            ),
                      _controller.index == 11
                          ? Tab1(number: items[11])
                          : Tab2(
                              number: items[11],
                              text: "Vegan",
                              width: 120,
                            ),
                    ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                height: size.height * 0.4,
                width: size.width,
                child: TabBarView(
                  controller: _controller,
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
                margin: EdgeInsets.all(8),
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
                      onPressed: () {}, icon: Icon(MyFlutterApp1.right_big,color: Theme.of(context).backgroundColor,))
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
