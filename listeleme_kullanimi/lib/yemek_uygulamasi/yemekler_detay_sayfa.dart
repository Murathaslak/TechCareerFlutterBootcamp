// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/yemek_uygulamasi/yemekler.dart';

class YemeklerDetaySayfa extends StatefulWidget {
  Yemekler yemek;
  YemeklerDetaySayfa({required this.yemek});

  @override
  State<YemeklerDetaySayfa> createState() => _YemeklerDetaySayfaState();
}

class _YemeklerDetaySayfaState extends State<YemeklerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var y = widget.yemek;
    return Scaffold(
      appBar: AppBar(
        title: Text(y.yemekAdi),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${y.yemekResimAdi}"),
            Text(
              "${y.yemekFiyat} ₺",
              style: TextStyle(fontSize: 48, color: Colors.blue),
            ),
            SizedBox(
              width: 200,
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                onPressed: () {},
                child: Text(
                  "SİPARİŞ VER",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
