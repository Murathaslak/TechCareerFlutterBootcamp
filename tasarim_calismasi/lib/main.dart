// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:tasarim_calismasi/renkler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print("Ekran yüksekliği: : $ekranYuksekligi");
    print("Ekran genişliği : $ekranGenisligi");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pizza",
          style: TextStyle(fontFamily: "Pacifico", fontSize: 22),
        ),
        backgroundColor: anaRenk,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Beef Cheese",
              style: TextStyle(
                  fontSize: 36, color: anaRenk, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset("resimler/pizza_resim.png"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(
                icerik: "Cheese",
              ),
              Chip(icerik: "Sausage"),
              Chip(icerik: "Olive"),
              Chip(icerik: "Pepper"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Text(
                "20 min",
                style: TextStyle(
                    fontSize: 22,
                    color: yaziRenk2,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Delivery",
                  style: TextStyle(
                      fontSize: 22,
                      color: anaRenk,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Meat lover, get ready to meet your pizza !",
                style: TextStyle(
                  fontSize: 22,
                  color: yaziRenk2,
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  "\$ 5.98",
                  style: TextStyle(
                      fontSize: 44,
                      color: anaRenk,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "ADD TO CART",
                      style: TextStyle(color: yaziRenk1, fontSize: 18),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: anaRenk,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Chip extends StatelessWidget {
  String icerik;
  Chip({
    required this.icerik,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        icerik,
        style: TextStyle(color: yaziRenk1),
      ),
      style: TextButton.styleFrom(
          backgroundColor: anaRenk,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)))),
    );
  }
}
