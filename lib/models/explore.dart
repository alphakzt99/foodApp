import 'package:flutter/material.dart';
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
  late final TabController controller =
      TabController(length: items.length, vsync: this);
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
              TabBarView(controller: controller, children: [
                TabBar(isScrollable: true, tabs: [
                  Tab(
                    icon: Icon(items[0]),
                  ),
                  Tab(icon: Icon(items[0])),
                ])
              ])
            ],
          ),
        ),
      ),
    );
  }
}
