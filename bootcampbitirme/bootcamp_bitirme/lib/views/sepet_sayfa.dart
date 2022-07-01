// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:bootcamp_bitirme/cubit/sepet_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/entity/sepet_yemekler.dart';
import 'package:bootcamp_bitirme/repo/yemeklerdao_repo.dart';
import 'package:bootcamp_bitirme/views/onayekran.dart';
import 'package:bootcamp_bitirme/views/sepet_yemek_detay_sayfa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SepetSayfa extends StatefulWidget {
  @override
  _SepetSayfaState createState() => _SepetSayfaState();
}

class _SepetSayfaState extends State<SepetSayfa> {
  int urunFiyat = 0;
  int toplamUrunFiyat = 0;
  String kullanici_adi = "osmanmurat";
  var yemekListe = [];
  var sepetIndex = [];
  @override
  void initState() {
    super.initState();
    context.read<SepetSayfaCubit>().sepetYukle(kullanici_adi);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
        titleTextStyle: TextStyle(fontSize: 24),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        actions: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: BlocBuilder<SepetSayfaCubitIslem, int>(
                    builder: (context, islem) {
                  if (islem == 0) {
                    return SizedBox(
                      height: 0,
                      width: 0,
                    );
                  } else {
                    return Text(
                      "₺ $islem ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                }),
              ))
        ],
      ),
      body: BlocBuilder<SepetSayfaCubit, List<SepetYemekler>>(
          builder: (context, sepettekilerListesi) {
        if (sepettekilerListesi.isNotEmpty) {
          return ListView.builder(
              itemCount: sepettekilerListesi.length,
              itemBuilder: (context, indeks) {
                var sepet = sepettekilerListesi[indeks];
                //Urun Fiyat Hesaplama
                urunFiyat = YemeklerDaoRepo().urunFiyatHesaplama(
                    fiyat: sepet.yemek_fiyat, adet: sepet.yemek_siparis_adet);
                //Burası 2 kez tetikleniyor o yüzden bu koşul şart!
                if (sepetIndex.contains(sepet.sepet_yemek_id) == false) {
                  if (yemekListe.contains(sepet.yemek_adi)) {
                    //Silinen Fiyatın Toplamdan Çıkartılması
                    toplamUrunFiyat -= urunFiyat;
                  }
                  sepetIndex.add(sepet.sepet_yemek_id);
                  //Fiyatın Toplanması
                  toplamUrunFiyat += urunFiyat;
                  context.read<SepetSayfaCubitIslem>().islem(toplamUrunFiyat);
                }

                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        toplamUrunFiyat = 0;
                        yemekListe = [];
                        sepetIndex = [];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SepetYemekDetaySayfa(
                                      sepetYemekler: sepet,
                                    ))).then((_) {
                          context
                              .read<SepetSayfaCubit>()
                              .sepetYukle(kullanici_adi);
                        });
                      },
                      child: Card(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                      height: 110,
                                      width: 110,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            color: Colors.grey.shade300,
                                            child: Image.network(
                                              "http://kasimadalan.pe.hu/yemekler/resimler/${sepet.yemek_resim_adi}",
                                              fit: BoxFit.fill,
                                            )),
                                      )),
                                  SizedBox(
                                    width: 220,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "${sepet.yemek_adi}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                // color: Colors.blue,
                                                child: Center(
                                                  child: Text(
                                                      sepet.yemek_siparis_adet,
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "₺ $urunFiyat ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 120,
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                                "${sepet.yemek_adi} silinsin mi?"),
                                            action: SnackBarAction(
                                              label: "Evet",
                                              onPressed: () {
                                                //Toplam Urun Fiyat Tetikleme
                                                toplamUrunFiyat = 0;
                                                yemekListe = [];
                                                sepetIndex = [];
                                                context
                                                    .read<
                                                        SepetSayfaCubitIslem>()
                                                    .islem(toplamUrunFiyat);
                                                //Yemek Silme İşlemi
                                                context
                                                    .read<SepetSayfaCubit>()
                                                    .yemekSil(
                                                        sepet.sepet_yemek_id,
                                                        kullanici_adi);
                                              },
                                            ),
                                          ));
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                        ),
                                      ),
                                    ]),
                              ),
                            ]),
                      ),
                    ),
                  ],
                );
              });
        } else {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                decoration: BoxDecoration(),
                width: 200,
                height: 200,
                child:
                    Lottie.asset("assets/lottie/melt.json", fit: BoxFit.fill),
              ),
              Text(
                "Sipariş verebilmek için sepete ürün ekleyiniz.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ]),
          );
        }
      }),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: SizedBox(
            width: 250,
            child: FloatingActionButton.extended(
              label: Row(
                children: const [
                  Text(
                    "Sipariş Ver",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {
                if (toplamUrunFiyat != 0) {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OnayEkran())))
                      .then((value) => Navigator.pop(context));
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //   content: Text(
                  //     "Siparişiniz Başarıyla Alınmıştır",
                  //     textAlign: TextAlign.center,
                  //   ),
                  //   backgroundColor: Colors.green,
                  // ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Sepete Ürün Ekleyiniz.",
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
