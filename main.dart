import 'package:flutter/material.dart';
import 'package:test_work/Test%202/catalogScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catalog',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: CatalogScreen(),
    );
  }
}
