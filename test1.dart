import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class CardModel {
  final Color color;
  bool isOpened;
  bool isMatched;

  CardModel({
    required this.color,
    this.isOpened = false,
    this.isMatched = false,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GamePage(),
    );
  }
}

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<CardModel> cards = [
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
  ];

  List<int> selectedIndexes = [];
  int errors = 0;
  String message = "";

  void onCardTap(int index) {
    if (cards[index].isOpened || cards[index].isMatched) return;

    setState(() {
      cards[index].isOpened = true;
      selectedIndexes.add(index);
    });

    if (selectedIndexes.length == 2) {
      checkMatch();
    }
  }

  void checkMatch() {
    int first = selectedIndexes[0];
    int second = selectedIndexes[1];

    if (cards[first].color == cards[second].color) {
      setState(() {
        cards[first].isMatched = true;
        cards[second].isMatched = true;
        message = "Успешно";
      });
    } else {
      errors++;

      if (errors >= 2) {
        setState(() {
          message = "У вас не осталось попыток";
        });
      }

      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          cards[first].isOpened = false;
          cards[second].isOpened = false;
        });
      });
    }

    selectedIndexes.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Найти пару"), centerTitle: true,),
      body: Column(
        children: [
          SizedBox(height: 20),

          Text("Ошибки: $errors"),

          Expanded(
            child: GridView.builder(
              itemCount: cards.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final card = cards[index];

                return GestureDetector(
                  onTap: () => onCardTap(index),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: card.isOpened || card.isMatched
                          ? card.color
                          : Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ),

          Text(
            message,
            style: TextStyle(fontSize: 20),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}