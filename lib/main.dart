import 'package:flutter/material.dart';
import 'package:food_app/Body.dart';

String font = 'RobotoSlab';
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
          shadowColor: Colors.black12,
          fontFamily: font,
        ),
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
        body: Body());
  }
}
