import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';



class ExploreData {
  final int id;
  final String text;
  final int num;
  final int price;
  final int num1;

  ExploreData(
      {required this.id,
      required this.text,
      required this.price,
      required this.num,
      required this.num1});
  Map<String, dynamic> toMap() {
    return {'id': id, 'text': text, 'price': price, 'num': num, 'num1': num1};
  }

  @override
  String toString() {
    return 'ExploreData{id : $id,text: $text, price: $price, num: $num, num: $num1}';
  }
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'Explore_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE EXPLORE(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT NOT NULL, price VALUE, num REAL,num1 REAL');
    },
    version: 1,
  );
 
}
