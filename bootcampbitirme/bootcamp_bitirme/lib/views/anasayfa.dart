// ignore_for_file: prefer_const_constructors

import 'package:bootcamp_bitirme/cubit/yemek_liste_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/entity/yemekler.dart';
import 'package:bootcamp_bitirme/views/yemek_detay_sayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sepet_sayfa.dart';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    super.initState();
    context.read<YemekListeCubit>().yemekleriYukle();
  }

  int tutar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Yemek"),
        titleTextStyle: TextStyle(fontSize: 24),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SepetSayfa()))
                    .then((value) {
                  //tutar = value;
                  print(tutar);
                });
              },
              icon: Icon(Icons.shopping_basket)),
        ],
      ),
      body: BlocBuilder<YemekListeCubit, List<Yemekler>>(
          builder: (context, yemeklerListesi) {
        if (yemeklerListesi.isNotEmpty) {
          return ListView.builder(
            itemCount: yemeklerListesi.length,
            itemBuilder: (context, indeks) {
              var yemek = yemeklerListesi[indeks];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                YemekDetaySayfa(yemek: yemek)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          SizedBox(
                              height: 130,
                              width: 130,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    color: Colors.grey.shade300,
                                    child: Image.network(
                                      "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}",
                                      fit: BoxFit.fill,
                                    )),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    yemek.yemek_adi,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text("₺ ${yemek.yemek_fiyat} ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ));
            },
          );
        } else {
          return Center();
        }
      }),
    );
  }
}
