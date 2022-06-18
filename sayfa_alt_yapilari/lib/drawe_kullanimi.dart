// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/sayfa_bir.dart';
import 'package:sayfa_alt_yapilari/sayfa_iki.dart';
import 'package:sayfa_alt_yapilari/sayfa_uc.dart';

class DrawerKullanimi extends StatefulWidget {
  DrawerKullanimi({Key? key}) : super(key: key);

  @override
  State<DrawerKullanimi> createState() => _DrawerKullanimiState();
}

class _DrawerKullanimiState extends State<DrawerKullanimi> {
  int secilenIndeks = 0;
  var sayfaListesi = [SayfaBir(), SayfaIki(), SayfaUc()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Kullanimi"),
        backgroundColor: Colors.deepPurple,
      ),
      body: sayfaListesi[secilenIndeks],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text(
                "Merhaba",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              title: Text("Bir"),
              leading: Icon(Icons.looks_one),
              onTap: () {
                setState(() {
                  secilenIndeks = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("İki"),
              leading: Icon(Icons.looks_two),
              onTap: () {
                setState(() {
                  secilenIndeks = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Üç"),
              leading: Icon(Icons.looks_3),
              onTap: () {
                setState(() {
                  secilenIndeks = 2;
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
