import 'package:flutter/material.dart';

class myApp extends StatefulWidget {
  @override
  myAppState createState() => myAppState();
}

class myAppState extends State<myApp> {
  String name = "";
  bool isSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 239, 239),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 219, 219, 219),
        title: Text(
          'Обратная связь',
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Напишите нам!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 16),

            Text(
              'Введите ваше имя и нажмите кнопку отправки',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 51, 51, 51),
              ),
            ),

            SizedBox(height: 16),

            TextField(
              onChanged: (value) {
                name = value;
              },

              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Введите ваше имя',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            /*if (name == " " || name=="")
            Text('Поле не может быть пустым',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 202, 0, 0),
                ),),
*/

            ElevatedButton(
              onPressed: () {
                setState(() {
                  isSent = true;
                });
              },
              child: Text('Отправить', style: TextStyle(fontSize: 12)),
            ),

            SizedBox(height: 16),

            if (isSent)
              Text(
                'Отправлено! Спасибо, $name.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: myApp());
  }
}
