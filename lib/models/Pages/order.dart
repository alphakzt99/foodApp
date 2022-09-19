import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
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
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).primaryColor,
                )),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: 7,
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  controller: controller,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        borderOnForeground: true,
                        elevation: 5,
                        shadowColor: Theme.of(context).shadowColor,
                        margin: const EdgeInsets.all(10),
                        child: Row(children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                image: DecorationImage(
                                    image:
                                        AssetImage("lib/assets/Chicken.jpg"))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Walgreens",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: font,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Fresh and Tasty",
                                style: TextStyle(
                                    color: Colors.black54, fontFamily: font),
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
                                    color: Theme.of(context).primaryColorDark),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: IconButton(
                                    splashRadius: 20,
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      setState(() {
                                        if (initial == 0) {
                                          initial = 0;
                                        }
                                        else{initial -= 1;}
                                        
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                initial.toString(),
                                style: TextStyle(
                                    fontFamily: font,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Theme.of(context).primaryColor),
                                    color: Theme.of(context).primaryColorLight,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: IconButton(
                                    splashRadius: 20,
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      setState(() {
                                        initial += 1;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
