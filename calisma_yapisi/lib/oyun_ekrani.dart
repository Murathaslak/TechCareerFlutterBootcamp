import 'package:calisma_yapisi/kisiler.dart';
import 'package:flutter/material.dart';

import 'package:calisma_yapisi/sonuc_ekrani.dart';

class OyunEkrani extends StatefulWidget {
  Kisiler kisi;
  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}

class _OyunEkraniState extends State<OyunEkrani> {
  Future<bool> geriDonusTusu(BuildContext context) async {
    print("Navigation geri tuşu tıklandı");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                print("Appbar geri tuşu tıklandı");
              });
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
        title: Text("Oyun Ekranı"),
      ),
      body: WillPopScope(
        onWillPop:() => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => SonucEkrani())));
                  },
                  child: const Text("Bitti")),
            ],
          ),
        ),
      ),
    );
  }
}
