import 'package:flutter/material.dart';
import 'package:test_work/Test%202/itemScreen.dart';

class CatalogScreen extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    10,
    (index) => {
      "title": "Item ${index + 1}",
      "description": "Description for Item ${index + 1}",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Catalog")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.image),
            title: Text(items[index]["title"]!),
            subtitle: Text(items[index]["description"]!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(
                    title: items[index]["title"]!,
                    description: items[index]["description"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
