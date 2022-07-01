// ignore_for_file: must_be_immutable, prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names


import 'package:bootcamp_bitirme/cubit/yemek_detay_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/entity/yemekler.dart';
import 'package:bootcamp_bitirme/repo/yemeklerdao_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetaySayfa extends StatefulWidget {
  Yemekler yemek;

  YemekDetaySayfa({required this.yemek});

  @override
  _YemekDetaySayfaState createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
  int gosterge = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int urunTutar = YemeklerDaoRepo().urunFiyatHesaplama(
        fiyat: widget.yemek.yemek_fiyat, adet: gosterge.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek Detay"),
        titleTextStyle: TextStyle(fontSize: 24),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Image.network(
                              "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}",
                              fit: BoxFit.fill))),
                  Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 6, bottom: 10),
                            child: Text(
                              "${widget.yemek.yemek_adi} :",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                              width: 60,
                              child: Text(
                                "${widget.yemek.yemek_fiyat} ₺",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ))
                        ]),
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 6, bottom: 10),
                        child: Text(
                          "Ürün Tutarı :",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          "$urunTutar ₺",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 140,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: IconButton(
                              onPressed: () {
                                if (gosterge == 0) {
                                  setState(() {
                                    gosterge = 1;
                                  });
                                } else {
                                  setState(() {
                                    setState(() {
                                      gosterge -= 1;
                                    });
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 24,
                              )),
                        ),
                        Text(
                          "$gosterge",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  gosterge += 1;
                                });
                              },
                              icon: Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (gosterge == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Ürün adetini 0 girdiğiniz için ürün sepetinize eklenmemiştir.",
                              textAlign: TextAlign.center),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            "Ürün Sepetinize Eklenmiştir",
                            textAlign: TextAlign.center,
                          ),
                          backgroundColor: Colors.green,
                        ));
                        var yemek_siparis_adet = gosterge;
                        setState(() {
                          var kullanici_adi = "osmanmurat";
                          context.read<YemekDetayCubit>().ekle(
                              widget.yemek.yemek_adi,
                              widget.yemek.yemek_resim_adi,
                              widget.yemek.yemek_fiyat,
                              yemek_siparis_adet,
                              kullanici_adi);
                          Navigator.of(context).pop();
                        });
                      }
                    },
                    child: Text(
                      "Sepete Ekleyin",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
