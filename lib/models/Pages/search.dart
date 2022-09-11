import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:food_app/my_flutter_app_icons1.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../../main.dart';

class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late ScrollController controller;
  bool pressed = false;
  @override
  void initState() {
    controller = ScrollController();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController textcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: size.width * 0.16),
          child: Text(
            "Search Food",
            style: TextStyle(
                fontFamily: font, color: Theme.of(context).primaryColor),
          ),
        ),
        leading: Container(
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Theme.of(context).primaryColor,
              )),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              width: size.width,
              height: size.height * 0.3,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: pressed ? 3 : 0),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextField(
                      style:
                          TextStyle(color: Theme.of(context).backgroundColor),
                      textInputAction: TextInputAction.search,
                      cursorColor: Theme.of(context).backgroundColor,
                      onTap: () {
                        setState(() {
                          pressed = true;
                        });
                      },
                      onEditingComplete: () {
                        setState(() {
                          pressed = false;
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          TernavIcons.bold.search,
                          color: Theme.of(context).backgroundColor,
                        ),
                        hintText: "Burger",
                        hintStyle:
                            TextStyle(color: Colors.white38, fontFamily: font),
                      ),
                      controller: textcontroller,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Container(
                      width: 250,
                      height: size.height * 0.2,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('lib/assets/search.png')))),
                ],
              )),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.only(top: 8),
                itemCount: 12,
                controller: controller,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    width: 50,
                    height: 150,
                    child: Column(children: [
                      Icon(TernavIcons.bold.card),
                      Text("Hello")
                    ]),
                    decoration: BoxDecoration(
                     
                      gradient: LinearGradient(colors: [
                        Theme.of(context).primaryColorLight,
                        Theme.of(context).primaryColorDark
                      ]),
                      borderRadius: BorderRadius.circular(20)),
                  );
                })),
          )
        ],
      ),
    );
  }
}
