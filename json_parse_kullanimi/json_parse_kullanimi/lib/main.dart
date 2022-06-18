import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_parse_kullanimi/filmler_api/filmler_cevap.dart';
import 'package:json_parse_kullanimi/kisiler_cevap.dart';
import 'package:json_parse_kullanimi/mesajlar.dart';

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
  void initState() {
    super.initState();
    //mesajParse();
    //kisilerPars();
    filmlerParse();
  }

  void mesajParse() {
    String veri = '{"success":1,"message":"Successfully"}';
    var jsonVeri = jsonDecode(veri);
    var mesaj = Mesajlar.fromJson(jsonVeri);
    print("Başarı : ${mesaj.success}");
    print("Mesaj : ${mesaj.message}");
  }

  void filmlerParse() {
    String veri =
        '{"filmler":[{"film_id":"1","film_ad":"Interstellar","film_yil":"2015","film_resim":"interstellar.png","kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},{"film_id":"2","film_ad":"Inception","film_yil":"2010","film_resim":"inception.png","kategori":{"kategori_id":"4","kategori_ad":"Bilim Kurgu"},"yonetmen":{"yonetmen_id":"1","yonetmen_ad":"Christopher Nolan"}},{"film_id":"3","film_ad":"The Pianist","film_yil":"2002","film_resim":"thepianist.png","kategori":{"kategori_id":"3","kategori_ad":"Drama"},"yonetmen":{"yonetmen_id":"4","yonetmen_ad":"Roman Polanski"}},{"film_id":"4","film_ad":"Bir Zamanlar Anadoluda","film_yil":"2011","film_resim":"birzamanlaranadoluda.png","kategori":{"kategori_id":"3","kategori_ad":"Drama"},"yonetmen":{"yonetmen_id":"3","yonetmen_ad":"Nuri Bilge Ceylan"}},{"film_id":"5","film_ad":"The Hateful Eight","film_yil":"2015","film_resim":"thehatefuleight.png","kategori":{"kategori_id":"1","kategori_ad":"Aksiyon"},"yonetmen":{"yonetmen_id":"2","yonetmen_ad":"Quentin Tarantino"}},{"film_id":"18","film_ad":"Django","film_yil":"2013","film_resim":"django.png","kategori":{"kategori_id":"1","kategori_ad":"Aksiyon"},"yonetmen":{"yonetmen_id":"2","yonetmen_ad":"Quentin Tarantino"}}],"success":1}';
    var jsonVeri = json.decode(veri);
    var filmlerCevap = FilmlerCevap.fromJson(jsonVeri);
    print("Başarı : ${filmlerCevap.success}");

    var filmlerListesi = filmlerCevap.filmler;
    for (var f in filmlerListesi) {
      print("Film id : ${f.film_id}");
      print("Film ad : ${f.film_ad}");
      print("Film yıl : ${f.film_yil}");
      print("Film resim : ${f.film_resim}");
      print("Film kategori : ${f.kategori.kategori_ad}");
      print("Film yönetmen : ${f.yonetmen.yonetmen_ad}");
    }
  }

  void kisilerPars() {
    String veri =
        '{"kisiler":[{"kisi_id":"10519","kisi_ad":"aass","kisi_tel":"ss-aa"},{"kisi_id":"10520","kisi_ad":"mehmet","kisi_tel":"0535641667"},{"kisi_id":"10522","kisi_ad":"321","kisi_tel":"321"},{"kisi_id":"10524","kisi_ad":"Davut","kisi_tel":"147852369"},{"kisi_id":"10526","kisi_ad":"Davut","kisi_tel":"147852369"},{"kisi_id":"10528","kisi_ad":"erkin","kisi_tel":"5292982449"},{"kisi_id":"10529","kisi_ad":"BurakYeni","kisi_tel":"12121212"},{"kisi_id":"10530","kisi_ad":"dada\u015f","kisi_tel":"dss"},{"kisi_id":"10531","kisi_ad":"dada\u015f","kisi_tel":"dss"},{"kisi_id":"10532","kisi_ad":"dada\u015f","kisi_tel":"dss"},{"kisi_id":"10534","kisi_ad":"test","kisi_tel":"123"},{"kisi_id":"10535","kisi_ad":"dd","kisi_tel":"11"},{"kisi_id":"10538","kisi_ad":"test ad Xcodedd","kisi_tel":"test tel yu"},{"kisi_id":"10539","kisi_ad":"aaa","kisi_tel":"ss"},{"kisi_id":"10540","kisi_ad":"321fh","kisi_tel":"321"},{"kisi_id":"10542","kisi_ad":"test","kisi_tel":"*492*304*023"},{"kisi_id":"10543","kisi_ad":"test retro ad","kisi_tel":"12312 y"},{"kisi_id":"10546","kisi_ad":"Dogus Testsss","kisi_tel":"321456"},{"kisi_id":"10547","kisi_ad":"Maryam","kisi_tel":"053922331456"},{"kisi_id":"10548","kisi_ad":"mary","kisi_tel":"veri88"},{"kisi_id":"10549","kisi_ad":"DAVUT2","kisi_tel":"147741147"}],"success":1}';
    var jsonVeri = json.decode(veri);
    var kisilerCevap = KisilerCevap.fromJson(jsonVeri);
    print("Başarı : ${kisilerCevap.success}");

    for (var k in kisilerCevap.kisiler) {
      print("***********************");
      print("Kişi id : ${k.kisi_id}");
      print("Kişi ad : ${k.kisi_ad}");
      print("Kişi tel : ${k.kisi_tel}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Parse Kullanımı"),
      ),
      body: const Center(),
    );
  }
}
