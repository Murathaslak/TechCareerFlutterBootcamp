// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/sayfa_bir.dart';
import 'package:sayfa_alt_yapilari/sayfa_iki.dart';
import 'package:sayfa_alt_yapilari/sayfa_uc.dart';

class TabsKullanimi extends StatefulWidget {
  const TabsKullanimi({Key? key}) : super(key: key);

  @override
  State<TabsKullanimi> createState() => _TabsKullanimiState();
}

class _TabsKullanimiState extends State<TabsKullanimi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tabs Kullanımı"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.looks_one),
                text: "Bir",
              ),
              Tab(
                icon: Icon(Icons.looks_two),
                text: "İki",
              ),
              Tab(
                icon: Icon(Icons.looks_3),
                text: "Uç",
              ),
            ],
            indicatorColor: Colors.orange,
            labelColor: Colors.pink,
          ),
        ),
        body: TabBarView(
          children: [SayfaBir(), SayfaIki(), SayfaUc()],
        ),
      ),
    );
  }
}
