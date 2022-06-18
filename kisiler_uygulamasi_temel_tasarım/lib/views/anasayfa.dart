// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/views/kisi_detay.dart';
import 'package:kisiler_uygulamasi/views/kisi_kay%C4%B1t_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyorMu = false;

  Future<List<Kisiler>> tumKisileriGoster() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                onChanged: (aramaSonucu) {
                  print("Arama sonucu : $aramaSonucu");
                },
                decoration: InputDecoration(hintText: "Ara"),
              )
            : Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: (() {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                  }),
                  icon: Icon(Icons.clear))
              : IconButton(
                  onPressed: (() {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  }),
                  icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
          future: tumKisileriGoster(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var kisilerListesi = snapshot.data;
              return ListView.builder(
                itemCount: kisilerListesi!.length,
                itemBuilder: (context, indeks) {
                  var kisi = kisilerListesi[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => KisiDetaySayfa(
                                    kisi: kisi,
                                  ))));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text("${kisi.kisi_ad} silinsin mi?"),
                                      action: SnackBarAction(
                                          label: "Evet",
                                          onPressed: () {
                                            print("Kişi Sil : ${kisi.kisi_id}");
                                          }),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.black45,
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Kayıt"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => KisiKayitSayfa())));
        },
      ),
    );
  }
}
