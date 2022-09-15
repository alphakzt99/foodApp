import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              border: Border.all(color: Theme.of(context).primaryColorLight)),
          child: Center(
            child: IconButton(
                onPressed: () {}, icon: Icon(TernavIcons.bold.arrow_left_1,color: Theme.of(context).primaryColorLight,)),
          ),
        ),
      ),
    );
  }
}
