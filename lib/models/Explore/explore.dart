import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_app/models/Explore/Offers.dart';
import 'package:food_app/models/Explore/Scroll.dart';
import 'package:food_app/models/Explore/Tab1.dart';
import 'package:food_app/models/Explore/bottom_bar.dart';
import 'package:food_app/models/Explore/exploreitemcard.dart';
import 'package:food_app/models/Explore/inheriteddataprovider.dart';
import 'package:food_app/models/Pages/favorites.dart';
import 'package:food_app/models/Pages/order.dart';
import 'package:food_app/models/Pages/payment.dart';
import 'package:food_app/models/SignUpLogin/SignUp.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';

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

class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  late int _currentPage;
  late TabController _controller;
  late TabController tabController;
  late ScrollController ExploreScrollcontroller =
      InheritedDataProvider.of(context).InheritedScrollcontroller;

  @override
  void initState() {
    _currentPage = 0;
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      final value = tabController.animation!.value.round();
      if (value != _currentPage && mounted) {
        changePage(value);
      }
    });
    _controller = TabController(length: items.length, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  void changePage(int newPage) {
    setState() {
      _currentPage = newPage;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    tabController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 70,
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
          child: InkWell(
            onTap: () => Drawer(),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).backgroundColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      color: Theme.of(context).shadowColor),
                ],
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 3,
                      width: 20,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 3,
                      width: 25,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      height: 3,
                      width: 15,
                    )
                  ]),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            controller: ExploreScrollcontroller,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              SizedBox(
                height: 30,
              ),
              Scroll(controller: _controller)
            ]),
          ),
        ),
      ),
    );
  }
}
