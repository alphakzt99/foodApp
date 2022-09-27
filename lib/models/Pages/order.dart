import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:food_app/main.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:ternav_icons/ternav_icons.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var initial = 1;
  late SwipeActionController _controller;
  ScrollController controller = ScrollController();
  @override
  void initState() {
    _controller = SwipeActionController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: [Container()],
        leadingWidth: 70,
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        leading: Container(
          width: 30,
          height: 30,
          margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Theme.of(context).primaryColor)),
          child: Center(
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(left: 25, top: 20),
          width: size.width,
          height: size.height * 0.08,
          child: RichText(
              textScaleFactor: 2,
              text: TextSpan(children: [
                TextSpan(
                    text: "My ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: font,
                        color: Theme.of(context).primaryColor)),
                TextSpan(
                    text: "Order",
                    style: TextStyle(
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark)),
                TextSpan(
                    text: " List",
                    style: TextStyle(
                        fontFamily: font,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor))
              ])),
        ),
        Expanded(
          child: Stack(children: [
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.5,
                child: ListView.builder(
                    itemCount: items.length,
                    padding: EdgeInsets.only(
                      bottom: 5,
                    ),
                    controller: controller,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(bottom: 5, top: 5, left: 15),
                          child: SwipeActionCell(
                            key: ValueKey(index),
                            trailingActions: [
                              SwipeAction(
                                  backgroundRadius: 20,
                                  color: Theme.of(context).primaryColor,
                                  content: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Icon(
                                        Icons.shopping_cart_outlined,
                                        color:
                                            Theme.of(context).backgroundColor,
                                      )),
                                  nestedAction: SwipeNestedAction(
                                      content: Container(
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                          width: size.width * 0.2,
                                          height: size.height * 0.12,
                                          child: OverflowBox(
                                              maxWidth: double.infinity,
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 16),
                                                      onPressed: () {
                                                        setState((){
                                                         if (initial == 0) {
                                                           items.removeAt(
                                                                index);
                                                            initial = 1;
                                                          }
                                                          initial -= 1;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.minus,
                                                        color: Theme.of(context)
                                                            .backgroundColor,
                                                      )),
                                                  Text(
                                                    initial.toString(),
                                                    style: TextStyle(
                                                        color: Theme.of(context)
                                                            .backgroundColor,
                                                        fontFamily: font,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  IconButton(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8,
                                                              horizontal: 16),
                                                      onPressed: () {
                                                        setState(() {
                                                          initial += 1;
                                                        });
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons.add,
                                                        color: Theme.of(context)
                                                            .backgroundColor,
                                                      ))
                                                ],
                                              )))),
                                  onTap: (CompletionHandler handler1) {}),
                              SwipeAction(
                                  backgroundRadius: 20,
                                  color: Theme.of(context).primaryColorDark,
                                  content: Container(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      color: Theme.of(context).backgroundColor,
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  nestedAction: SwipeNestedAction(
                                      content: Container(
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColorDark),
                                          width: size.width * 0.2,
                                          height: size.height * 0.12,
                                          child: OverflowBox(
                                            maxWidth: double.infinity,
                                            child: OutlinedButton(
                                                style: ButtonStyle(
                                                    side: MaterialStateProperty
                                                        .all(BorderSide(
                                                            color: Colors
                                                                .transparent))),
                                                onPressed: () {
                                                  items.removeAt(index);
                                                  setState(() {});
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      CupertinoIcons.delete,
                                                      color: Theme.of(context)
                                                          .backgroundColor,
                                                    ),
                                                    Text(
                                                      " Delete",
                                                      style: TextStyle(
                                                          color: Theme.of(
                                                                  context)
                                                              .backgroundColor,
                                                          fontFamily: font,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    )
                                                  ],
                                                )),
                                          ))),
                                  onTap: (CompletionHandler handler) async {
                                    await handler(true);
                                    items.removeAt(index);
                                    setState(() {});
                                  }),
                            ],
                            child: Container(
                              color: Theme.of(context).backgroundColor,
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: MediaQuery.of(context).size.height * 0.12,
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.all(5),
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            offset: Offset(5, 5),
                                            blurRadius: 5,
                                            color:
                                                Theme.of(context).shadowColor)
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      image:
                                          DecorationImage(image: items[index])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 0),
                                  child: Center(
                                    child: Text(
                                      "${initial.toString()}x",
                                      style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontFamily: font,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Walgreens",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: font,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "25 Minutes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: font,
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .primaryColorDark),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * 0.1),
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "\$",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: font,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                        TextSpan(
                                            text: "100",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: font,
                                                fontWeight: FontWeight.bold,
                                                color: Theme.of(context)
                                                    .primaryColor)),
                                      ])),
                                )
                              ]),
                            ),
                          ),
                        )),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal: ",
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "\$ 800",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax: ",
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "\$ 10",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery: ",
                          style: TextStyle(
                              color: Theme.of(context).focusColor,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Text(
                          "\$ 8",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total: ",
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        Text(
                          "\$ 180000",
                          style: TextStyle(
                              color: Theme.of(context).backgroundColor,
                              fontFamily: font,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColorDark)),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              MyFlutterApp.cc_visa,
                              color: Theme.of(context).backgroundColor,
                            ),
                            Text(
                              "  Pay",
                              style: TextStyle(
                                  color: Theme.of(context).backgroundColor,
                                  fontFamily: font,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ]),
                ),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}

List<AssetImage> items = [
  AssetImage("lib/assets/Snacks.jpg"),
  AssetImage("lib/assets/Chicken.jpg"),
  AssetImage("lib/assets/Snacks.jpg"),
  AssetImage("lib/assets/Chicken.jpg"),
  AssetImage("lib/assets/Snacks.jpg"),
  AssetImage("lib/assets/Chicken.jpg"),
  AssetImage("lib/assets/Snacks.jpg"),
  AssetImage("lib/assets/Chicken.jpg"),
];
