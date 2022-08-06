import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:food_app/models/SignUpLogin/login_page.dart';
import 'package:food_app/my_flutter_app_icons.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  ScrollController controller = ScrollController();
  TextEditingController textEditing = TextEditingController();
  late final TabController _controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    textfield(String text, Icon icon, TextInputType text1) {
      return TextField(
          cursorColor: Theme.of(context).primaryColorDark,
          controller: textEditing,
          keyboardType: text1,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(2),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide:
                    BorderSide(color: Theme.of(context).primaryColorLight)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            hintText: text,
            hintStyle:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.w400),
            prefixIcon: icon,
          ));
    }

    Widget bigCircle = Container(
      width: size.width * 0.1,
      height: size.width * 0.1,
      child: Icon(
        Icons.fastfood_outlined,
        size: 20,
        color: Theme.of(context).primaryColor,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorLight,
      ),
    );
    Widget circle = Container(
      width: size.width * 0.1,
      height: size.width * 0.1,
      child: Icon(
        Icons.emoji_food_beverage,
        size: 20,
        color: Theme.of(context).backgroundColor,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColorDark,
      ),
    );
    Widget circle1 = Container(
      width: size.width * 0.08,
      height: size.width * 0.08,
      child: Icon(
        Icons.delivery_dining,
        size: 20,
        color: Theme.of(context).primaryColor,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).backgroundColor,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0,
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: 60,
        elevation: 0,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
            child: Center(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                  child: Text(
                    "Need Some Help?",
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Theme.of(context).backgroundColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
        leading: Container(
          margin: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
          // ignore: prefer_const_literals_to_create_immutables
          child: IconButton(
              padding: EdgeInsets.only(left: 8),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).backgroundColor,
              )),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  color: Theme.of(context).primaryColor),
              width: size.width,
              child: Column(
                children: [
                  Stack(children: [
                    Positioned(left: 50, child: bigCircle),
                    Positioned(top: 60, left: 310, child: circle),
                    Positioned(top: 90, left: 80, child: circle1),
                    Center(
                        child: Image.asset(
                      'lib/assets/pic.png',
                      width: size.width,
                      height: size.height * 0.2,
                    )),
                  ]),
                ],
              ),
            ),
            DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                              width: 0, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: TabBar(
                          controller: _controller,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).backgroundColor),
                          indicatorColor: Theme.of(context).primaryColorDark,
                          labelColor: Theme.of(context).primaryColorDark,
                          unselectedLabelColor:
                              Theme.of(context).backgroundColor,
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          unselectedLabelStyle:
                              const TextStyle(fontWeight: FontWeight.normal),
                          tabs: [
                            Tab(
                              text: "Sign Up",
                            ),
                            Tab(text: "Login")
                          ]),
                    ),
                    Container(
                        color: Theme.of(context).backgroundColor,
                        width: size.width,
                        height: size.height * 0.576,
                        child: TabBarView(
                          //if u want to control the TabBar, make sure to use controller and play the index
                          controller: _controller,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 25, top: 20, bottom: 5),
                                    child: Text(
                                      "Getting started",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 25,
                                      bottom: 20,
                                    ),
                                    child: Text(
                                      "Create account to continue!",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: MaterialButton(
                                            minWidth: size.width * 0.1,
                                            shape: CircleBorder(
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor)),
                                            onPressed: () {},
                                            child: Icon(
                                              MyFlutterApp.facebook,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              size: 20,
                                            )),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      MaterialButton(
                                          minWidth: size.width * 0.1,
                                          shape: CircleBorder(
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          onPressed: () {},
                                          child: Icon(
                                            MyFlutterApp.google,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 20,
                                          )),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      MaterialButton(
                                          minWidth: size.width * 0.1,
                                          shape: CircleBorder(
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          onPressed: () {},
                                          child: Icon(
                                            MyFlutterApp.twitter,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    child: Column(
                                      children: [
                                        textfield(
                                            "Email Address",
                                            Icon(
                                              Icons.email_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            TextInputType.emailAddress),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        textfield(
                                            "Username",
                                            Icon(
                                              Icons.person_outlined,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            TextInputType.text),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        textfield(
                                            "Password",
                                            Icon(
                                              Icons.lock_outline,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            TextInputType.visiblePassword),
                                        SizedBox(height: 20),
                                        OutlinedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30))),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Theme.of(context)
                                                            .primaryColorDark)),
                                            onPressed: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 7,
                                                      horizontal: 122),
                                              child: Text(
                                                'Sign Up',
                                                style: TextStyle(
                                                    fontFamily: "Tiro Kannada",
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .backgroundColor),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: 'Already have an account? ',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          TextSpan(
                                              text: "Sign in",
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColorDark),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap =
                                                    () => _controller.index = 1)
                                        ]))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Login(controller1: _controller)
                          ],
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
