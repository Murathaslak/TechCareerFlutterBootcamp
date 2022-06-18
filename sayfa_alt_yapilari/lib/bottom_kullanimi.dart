// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/sayfa_bir.dart';
import 'package:sayfa_alt_yapilari/sayfa_iki.dart';
import 'package:sayfa_alt_yapilari/sayfa_uc.dart';

class BottomNavigationKullanimi extends StatefulWidget {
  BottomNavigationKullanimi({Key? key}) : super(key: key);

  @override
  State<BottomNavigationKullanimi> createState() =>
      _BottomNavigationKullanimiState();
}

class _BottomNavigationKullanimiState extends State<BottomNavigationKullanimi> {
  int secilenIndeks = 0;
  var sayfaListesi = [SayfaBir(), SayfaIki(), SayfaUc()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Kullanimi"),
        backgroundColor: Colors.deepPurple,
      ),
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Bir"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "İki"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Üç"),
        ],
        currentIndex: secilenIndeks,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white38,
        backgroundColor: Colors.deepPurple,
        onTap: (indeks) {
          setState(() {
            secilenIndeks = indeks;
          });
        },
      ),
    );
  }
}
