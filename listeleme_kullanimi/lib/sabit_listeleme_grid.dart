// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class SabitListelemeGrid extends StatefulWidget {
  SabitListelemeGrid({Key? key}) : super(key: key);

  @override
  State<SabitListelemeGrid> createState() => _SabitListelemeGridState();
}

class _SabitListelemeGridState extends State<SabitListelemeGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sabit Listeleme"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 2 / 1, // 2 : Genişlik, 1 : Yüksekliği,
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
              print("Yıldız Tıklanndı");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.black45,
                    ),
                    Text("Yıldız"),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Güneş Tıklanndı");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.black45,
                    ),
                    Text("Güneş"),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("Ay Tıklanndı");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.black45,
                    ),
                    Text("Ay"),
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
