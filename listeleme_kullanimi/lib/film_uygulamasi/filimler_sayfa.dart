// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/film_uygulamasi/filimler.dart';
import 'package:listeleme_kullanimi/film_uygulamasi/filmler_detay_sayfa.dart';

class FilimlerSayfa extends StatefulWidget {
  @override
  State<FilimlerSayfa> createState() => _FilimlerSayfaState();
}

class _FilimlerSayfaState extends State<FilimlerSayfa> {
  Future<List<Filmler>> filmleriGetir() async {
    var filmListesi = <Filmler>[];
    var f1 = Filmler(
        filmId: 1,
        filmAdi: "Anadoluda",
        filmResimAdi: "anadoluda.png",
        filmFiyat: 21.99);
    var f2 = Filmler(
        filmId: 1,
        filmAdi: "Django",
        filmResimAdi: "django.png",
        filmFiyat: 15.99);
    var f3 = Filmler(
        filmId: 1,
        filmAdi: "Inception",
        filmResimAdi: "inception.png",
        filmFiyat: 14.99);
    var f4 = Filmler(
        filmId: 1,
        filmAdi: "Interstellar",
        filmResimAdi: "interstellar.png",
        filmFiyat: 25.99);
    var f5 = Filmler(
        filmId: 1,
        filmAdi: "The Hatefull Eight",
        filmResimAdi: "thehatefuleight.png",
        filmFiyat: 8.99);
    var f6 = Filmler(
        filmId: 1,
        filmAdi: "The Pianist",
        filmResimAdi: "thepianist.png",
        filmFiyat: 15.99);
    filmListesi.add(f1);
    filmListesi.add(f2);
    filmListesi.add(f3);
    filmListesi.add(f4);
    filmListesi.add(f5);
    filmListesi.add(f6);
    return filmListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler"),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGetir(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              itemCount: filmlerListesi!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3.5),
              itemBuilder: (context, indeks) {
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FilmlerDetaySayfa(film: film)));
                  }),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("resimler/${film.filmResimAdi}"),
                        ),
                        Text(
                          film.filmAdi,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${film.filmFiyat} ₺",
                          style: TextStyle(fontSize: 16, color: Colors.blue),
                        ),
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
