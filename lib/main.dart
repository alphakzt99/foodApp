import 'package:flutter/material.dart';
import 'package:food_app/Body.dart';
void main() => runApp(const FoodApp());

class FoodApp extends StatelessWidget {
  const FoodApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hmar Kya Mal",
        theme: ThemeData(
            // ignore: prefer_const_constructors
            backgroundColor: Color(0xFFEAEFEF),
            primaryColorLight: Color(0xFFFFC529),
            primaryColor: Color(0xFF272D2F),
            primaryColorDark: Color(0xFFFE724C),
<<<<<<< HEAD
            fontFamily: 'RobotoSlab'),
=======
            fontFamily: 'Mukta'),
>>>>>>> 43a5b1c1c51195c4f2ed37c05f2d2b8900f8dc38
        home: Home());
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Body()
        );
  }
}


