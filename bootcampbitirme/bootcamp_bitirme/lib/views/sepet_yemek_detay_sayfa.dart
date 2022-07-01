// ignore_for_file: must_be_immutable, prefer_const_constructors, non_constant_identifier_names


import 'package:bootcamp_bitirme/cubit/yemek_detay_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/entity/sepet_yemekler.dart';
import 'package:bootcamp_bitirme/repo/yemeklerdao_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetYemekDetaySayfa extends StatefulWidget {
  SepetYemekler sepetYemekler;

  SepetYemekDetaySayfa({required this.sepetYemekler});

  @override
  _SepetYemekDetaySayfaState createState() => _SepetYemekDetaySayfaState();
}

class _SepetYemekDetaySayfaState extends State<SepetYemekDetaySayfa> {
  int gosterge = 0;
  @override
  void initState() {
    super.initState();

    gosterge = int.parse(widget.sepetYemekler.yemek_siparis_adet);
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranGenisligi = ekranBilgisi.size.width;
    int urunTutar = YemeklerDaoRepo().urunFiyatHesaplama(
        fiyat: widget.sepetYemekler.yemek_fiyat, adet: gosterge.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet Yemek Detay"),
        titleTextStyle: TextStyle(fontSize: 24),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: ekranGenisligi / 1.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 250,
                    width: ekranGenisligi / 1.2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Image.network(
                              "http://kasimadalan.pe.hu/yemekler/resimler/${widget.sepetYemekler.yemek_resim_adi}",
                              fit: BoxFit.cover)),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 6, bottom: 6),
                            child: Text(
                              widget.sepetYemekler.yemek_adi,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          SizedBox(
                              width: 60,
                              child: Text(
                                "${widget.sepetYemekler.yemek_fiyat} ₺",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ))
                        ]),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 6),
                      child: Text(
                        "Ürününüzün Tutarı :",
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Ürün Adedini Belirleyiniz:",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            gosterge += 1;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          size: 24,
                        )),
                    Text(
                      "$gosterge",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          if (gosterge <= 0) {
                            gosterge = 0;
                          } else {
                            setState(() {
                              gosterge -= 1;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.remove,
                          size: 24,
                        )),
                  ],
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
                        var kullanici_adi = "osmanmurat";
                        context.read<YemekDetayCubit>().guncelle(
                            widget.sepetYemekler.sepet_yemek_id,
                            widget.sepetYemekler.yemek_adi,
                            widget.sepetYemekler.yemek_resim_adi,
                            widget.sepetYemekler.yemek_fiyat,
                            yemek_siparis_adet,
                            kullanici_adi);
                      }
                    },
                    child: Text("Sepete Ekleyin"),
                    style: ElevatedButton.styleFrom()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
