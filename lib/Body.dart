import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/Explore/bottom_bar.dart';

import 'package:food_app/models/Explore/explore.dart';
import 'package:food_app/models/Pages/search.dart';
import 'package:food_app/models/Pages/order.dart';
import 'package:food_app/models/Pages/account.dart';

import 'package:food_app/models/SignUpLogin/signUp.dart';
import 'package:path/path.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with SingleTickerProviderStateMixin {
  late int CurrentPage;
  late TabController tabcontroller;
  @override
  void initState() {
    tabcontroller = TabController(length: 3, vsync: this);
    CurrentPage = 0;
    tabcontroller.animation!.addListener(() {
      final value = tabcontroller.animation!.value.round();
      if (value != CurrentPage && mounted) {
        changePage(value);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  void changePage(int nextPage) {
    setState(() {
      CurrentPage = nextPage;
    });
  }

  @override
  void dispose() {
    tabcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
          height: size.height,
          color: Theme.of(context).backgroundColor,
          child: Column(children: [
            Stack(
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor),
                        children: [
                      TextSpan(text: '''The Fastest Delivery
                                      in'''),
                      TextSpan(
                          text: " Your City",
                          style: TextStyle(
                              color: Theme.of(context).primaryColorDark))
                    ]))
              ],
            ),
            SizedBox(
              width: size.height * 0.09,
            ),
            Stack(
              children: [
                Positioned(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.27,
                      ),
                      Center(
                        child: ClipPath(
                          clipper: BackgroundClipper(),
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.5,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: size.height * 0.15,
                    left: size.width * 0.05,
                    width: size.width * 0.9,
                    child: Image.asset('lib/assets/junk.png')),
                Positioned(
                  height: size.height * 0.5,
                  top: size.height * 0.5,
                  left: size.width * 0.21,
                  child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).backgroundColor),
                          children: [
                        TextSpan(text: "Hungry? "),
                        TextSpan(
                            text: "Let's Order!",
                            style: TextStyle(
                                color: Theme.of(context).primaryColorLight))
                      ])),
                ),
                Positioned(
                    height: size.height * 0.6,
                    width: size.width,
                    top: size.height * 0.57,
                    child: Column(children: [
                      OutlinedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BottomBar(
                                        child: TabBarView(
                                            dragStartBehavior:
                                                DragStartBehavior.down,
                                            physics: PageScrollPhysics(),
                                            controller: tabcontroller,
                                            children: [
                                              Explore(),
                                              Favorites(),
                                              Profile()
                                            ]),
                                        end: 2,
                                        start: 10,
                                        currentPage: CurrentPage,
                                        bottomtabcontroller: tabcontroller,
                                        unselectedColor:
                                            Theme.of(context).backgroundColor,
                                        barcolor:
                                            Theme.of(context).primaryColor,
                                        selectedColor:
                                            Theme.of(context).primaryColorDark,
                                      ))),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: size.width * 0.04,
                                    horizontal: size.width * 0.28)),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColorDark),
                          ),
                          child: Text(
                            "Explore",
                            style: TextStyle(
                                color: Theme.of(context).backgroundColor,
                                fontFamily: "RobotoSlab",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      OutlinedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp())),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: size.width * 0.04,
                                    horizontal: size.width * 0.24)),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).backgroundColor),
                          ),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: "RobotoSlab",
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ]))
              ],
            ),
          ])),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.3);
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(0, size.height, 50, size.height);
    path.lineTo(size.width - 50, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - 50);

    path.lineTo(size.width, 45);
    path.quadraticBezierTo(size.width - 20, 0, size.width - 70, 20);
    path.lineTo(50 * 0.6, size.height * 0.33 - 50 * 0.3);
    // width is the start of the curve and the height is the end of the curve
    path.quadraticBezierTo(0, size.height * 0.33, 0, size.height * 0.33 + 50);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
