// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/yemek_uygulamasi/yemekler.dart';
import 'package:listeleme_kullanimi/yemek_uygulamasi/yemekler_detay_sayfa.dart';

class YemeklerSayfa extends StatefulWidget {
  YemeklerSayfa({Key? key}) : super(key: key);

  @override
  State<YemeklerSayfa> createState() => _YemeklerSayfaState();
}

class _YemeklerSayfaState extends State<YemeklerSayfa> {
  Future<List<Yemekler>> yemekleriGetir() async {
    var yemeklerListesi = <Yemekler>[];
    var y1 = Yemekler(
        yemekId: 1,
        yemekAdi: "Ayran",
        yemekResimAdi: "ayran.png",
        yemekFiyat: 25.99);
    var y2 = Yemekler(
        yemekId: 1,
        yemekAdi: "Baklava",
        yemekResimAdi: "baklava.png",
        yemekFiyat: 25.99);
    var y3 = Yemekler(
        yemekId: 1,
        yemekAdi: "Fanta",
        yemekResimAdi: "fanta.png",
        yemekFiyat: 25.99);
    var y4 = Yemekler(
        yemekId: 1,
        yemekAdi: "Kadayif",
        yemekResimAdi: "kadayif.png",
        yemekFiyat: 25.99);
    var y5 = Yemekler(
        yemekId: 1,
        yemekAdi: "Makarna",
        yemekResimAdi: "makarna.png",
        yemekFiyat: 25.99);
    var y6 = Yemekler(
        yemekId: 1,
        yemekAdi: "Kofte",
        yemekResimAdi: "kofte.png",
        yemekFiyat: 25.99);
    yemeklerListesi.add(y1);
    yemeklerListesi.add(y2);
    yemeklerListesi.add(y3);
    yemeklerListesi.add(y4);
    yemeklerListesi.add(y5);
    yemeklerListesi.add(y6);
    return yemeklerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var yemeklerListesi = snapshot.data;
            return ListView.builder(
              itemCount: yemeklerListesi!.length,
              itemBuilder: (context, indeks) {
                var yemek = yemeklerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                YemeklerDetaySayfa(yemek: yemek)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset(
                              "resimler/${yemek.yemekResimAdi}",
                            )),
                        Column(
                          children: [
                            Text(
                              yemek.yemekAdi,
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(height: 50),
                            Text("${yemek.yemekFiyat} ₺",
                                style:
                                    TextStyle(fontSize: 25, color: Colors.blue))
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right)
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
