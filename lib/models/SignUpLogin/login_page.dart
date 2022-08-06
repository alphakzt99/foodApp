import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../my_flutter_app_icons.dart';

class Login extends StatefulWidget {
  final TabController controller1;

  Login({
    Key? key,
    required this.controller1,
  }) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController textEditingController = TextEditingController();

  textfield(String text, Icon icon, TextInputType text1) {
    return TextField(
        cursorColor: Theme.of(context).primaryColorDark,
        controller: textEditingController,
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    bool isSwitched = true;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20, bottom: 5),
            child: Text(
              "Welcome Back",
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
              "Login to fill your tummy quickly",
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
                padding: const EdgeInsets.only(left: 15),
                child: MaterialButton(
                    minWidth: size.width * 0.1,
                    shape: CircleBorder(
                        side:
                            BorderSide(color: Theme.of(context).primaryColor)),
                    onPressed: () {},
                    child: Icon(
                      MyFlutterApp.facebook,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                  minWidth: size.width * 0.1,
                  shape: CircleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  onPressed: () {},
                  child: Icon(
                    MyFlutterApp.google,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  )),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                  minWidth: size.width * 0.1,
                  shape: CircleBorder(
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  onPressed: () {},
                  child: Icon(
                    MyFlutterApp.twitter,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              children: [
                textfield(
                    "Email Address",
                    Icon(
                      Icons.email_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    TextInputType.emailAddress),
                SizedBox(
                  height: 10,
                ),
                textfield(
                    "Password",
                    Icon(
                      Icons.lock_outline,
                      color: Theme.of(context).primaryColor,
                    ),
                    TextInputType.visiblePassword),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Remember me next time',
                      style: TextStyle(fontSize: 20),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) => setState(() {
                        isSwitched = value;
                      }),
                      activeColor: Theme.of(context).backgroundColor,
                      activeTrackColor: Theme.of(context).primaryColorLight,
                      inactiveThumbColor: Theme.of(context).backgroundColor,
                      inactiveTrackColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
                SizedBox(height: 10),
                OutlinedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColorDark)),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 122),
                      child: Text(
                        '  Login  ',
                        style: TextStyle(
                            fontFamily: "Tiro Kannada",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).backgroundColor),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                  TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => widget.controller1.index = 0)
                ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
