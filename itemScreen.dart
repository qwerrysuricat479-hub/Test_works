import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  final String title;
  final String description;

  ItemScreen({required this.title, required this.description});

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(widget.description),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isFavorite ? const Color.fromARGB(255, 123, 199, 125) : const Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: toggleFavorite,
              child: Text(
                isFavorite ? "Added to favorites" : "Add to favorites",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
