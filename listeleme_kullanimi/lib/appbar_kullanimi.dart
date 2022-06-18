// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class AppBarKullanimi extends StatefulWidget {
  AppBarKullanimi({Key? key}) : super(key: key);

  @override
  State<AppBarKullanimi> createState() => _AppBarKullanimiState();
}

class _AppBarKullanimiState extends State<AppBarKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.dehaze),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Başlık",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Alt Başlık",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        backgroundColor: Colors.red,
        actions: [
          TextButton(
            onPressed: () {
              print("Çıkış Tıklandı");
            },
            child: Text(
              "Çıkış",
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              print("Bilgi Icon Tıklandı");
            },
            icon: Icon(Icons.info_outline),
          ),
          IconButton(
              onPressed: () {
                print("Daha Fazla Icon Tıklandı");
              },
              icon: Icon(Icons.more_vert)),
          PopupMenuButton(
            child: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Sil"),
                value: 1,
              ),
              PopupMenuItem(
                child: Text("Güncelle"),
                value: 2,
              )
            ],
            onSelected: (menuItemValue) {
              if (menuItemValue == 1) {
                print("Sil Tıklandı");
              }
              if (menuItemValue == 2) {
                print("Güncelle Tıklandı");
              }
            },
          )
        ],
      ),
    );
  }
}
