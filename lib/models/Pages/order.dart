import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
import 'package:food_app/my_flutter_app_icons.dart';
import 'package:ternav_icons/ternav_icons.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  var initial = 0;

  ScrollController controller = ScrollController();
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
          flex: 1,
          child: Stack(children: [
            Positioned(
              top: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.5,
                child: ListView.builder(
                    itemCount: 7,
                    padding: EdgeInsets.only(bottom: 10),
                    controller: controller,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Container(
                          color: Theme.of(context).backgroundColor,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.12,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10),
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
                                        color: Theme.of(context).shadowColor)
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "lib/assets/Chicken.jpg"))),
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
                                      color:
                                          Theme.of(context).primaryColorDark),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.1),
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
