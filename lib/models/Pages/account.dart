import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          color: Theme.of(context).primaryColor,
          width: size.width,
          height: size.height * 0.3,
          child: Column(
            children: [
              Text(
                "Hi, User",
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              CircleAvatar(
                radius: 20,
                foregroundImage: AssetImage('lib/assets/Snacks.jpg'),
              )
            ],
          )),
    );
  }
}
