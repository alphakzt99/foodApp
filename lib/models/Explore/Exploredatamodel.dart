import 'dart:async';
import 'package:path/path.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

class ExploreData {
  final int id;
  final String text;
  final int num;
  final int price;

  ExploreData(
      {required this.id,
      required this.text,
      required this.price,
      required this.num});
}

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'Explore_database.db'),
    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE EXPLORE (id INTEGER PRIMARY KEY, text TEXT, price VALUE, num REAL');
    },
  );
}
