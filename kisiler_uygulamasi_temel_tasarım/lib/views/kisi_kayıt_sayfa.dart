// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class KisiKayitSayfa extends StatefulWidget {
  KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  // ignore: non_constant_identifier_names
  Future<void> kayit(String kisi_ad, String kisi_tel) async {
    print("Kişi Kayıt : $kisi_ad - $kisi_tel");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kişi Kayıt")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiAdi,
                decoration: InputDecoration(hintText: "Kişi Ad"),
              ),
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(hintText: "Kişi Tel"),
              ),
              ElevatedButton(
                  onPressed: () {
                    kayit(tfKisiAdi.text, tfKisiTel.text);
                  },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
