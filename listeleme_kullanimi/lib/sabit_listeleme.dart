// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SabitListeleme extends StatefulWidget {
  const SabitListeleme({Key? key}) : super(key: key);

  @override
  State<SabitListeleme> createState() => _SabitListelemeState();
}

class _SabitListelemeState extends State<SabitListeleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sabit Listeleme"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text("Güneş"),
            subtitle: Text("Güneş alt başlık"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Güneş Tıklandı");
            },
          ),
          ListTile(
            leading: Icon(Icons.brightness_2),
            title: Text("Ay"),
            subtitle: Text("Ay alt başlık"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Ay Tıklandı");
            },
          ),
          GestureDetector(
            onTap: () {
              print("Tıklanndı");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Yıldız"),
                    Spacer(),
                    InkWell(
                      
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black45,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
