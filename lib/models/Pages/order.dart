import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
import 'package:ternav_icons/ternav_icons.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
          ListView.builder(
              controller: controller,
              shrinkWrap: true,
              itemBuilder: (context, index) => orderList(context)),
        ],
      ),
    );
  }
}

Widget orderList(context) {
  var initial = 0;

  return Card(
    borderOnForeground: true,
    elevation: 5,
    shadowColor: Theme.of(context).shadowColor,
    margin: const EdgeInsets.all(10),
    child: Row(children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("lib/assets/Chicken.jpg"))),
      ),
      Column(
        children: [
          Text("Walgreens"),
          Text("Fresh and Tasty"),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () {
                    initial += 1;
                  },
                  icon: Icon(
                    TernavIcons.bold.add,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              Text(
                initial.toString(),
                style: TextStyle(
                    fontFamily: font,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  onPressed: () {
                    initial += 1;
                  },
                  icon: Icon(
                    TernavIcons.bold.decrease_cart,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
            ],
          )
        ],
      )
    ]),
  );
}
