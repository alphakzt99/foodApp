import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: ((context, index) => Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 5,
                      color: Theme.of(context).shadowColor),
                ],
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(20)),
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.1,
              child: ListTile(
                contentPadding: const EdgeInsets.all(8),
                leading: Image.asset('lib/assets/coffee.png'),
                title: const Text(
                  "20% off on new comers",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )));
  }
}
