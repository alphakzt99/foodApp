import 'package:flutter/material.dart';
import 'package:food_app/models/Explore/Tab1.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class Explore extends StatefulWidget {
  Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with SingleTickerProviderStateMixin {
  List items = [
    MyFlutterApp.hamburger,
    MyFlutterApp.cheese,
    MyFlutterApp.bread_slice,
    MyFlutterApp.hotdog,
    MyFlutterApp.ice_cream,
    MyFlutterApp.mug_hot,
    MyFlutterApp.pizza_slice,
    MyFlutterApp.pepper_hot
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
    var _selectedIndex = 0;

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
                            ? Tab1(items: items, num: 0)
                            : Tab2(
                                items: items,
                                num: 0,
                                text: "Burger",
                                width: 120,
                              ),
                        _controller.index == 1
                            ? Tab1(items: items, num: 1)
                            : Tab2(
                                items: items,
                                num: 1,
                                text: "Cake",
                                width: 110,
                              ),
                        _controller.index == 2
                            ? Tab1(items: items, num: 2)
                            : Tab2(
                                items: items,
                                num: 2,
                                text: "Bread",
                                width: 120,
                              ),
                        _controller.index == 3
                            ? Tab1(items: items, num: 3)
                            : Tab2(
                                items: items,
                                num: 3,
                                text: "HotDog",
                                width: 140,
                              ),
                        _controller.index == 4
                            ? Tab1(items: items, num: 4)
                            : Tab2(
                                items: items,
                                num: 4,
                                text: "Dessert",
                                width: 140,
                              ),
                        _controller.index == 5
                            ? Tab1(items: items, num: 5)
                            : Tab2(
                                items: items,
                                num: 5,
                                text: "Drinks",
                                width: 120,
                              ),
                        _controller.index == 6
                            ? Tab1(items: items, num: 6)
                            : Tab2(
                                items: items,
                                num: 6,
                                text: "Fast Food",
                                width: 200,
                              ),
                        _controller.index == 7
                            ? Tab1(items: items, num: 7)
                            : Tab2(
                                items: items,
                                num: 7,
                                text: "Spice",
                                width: 120,
                              ),
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}
