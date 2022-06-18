// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/film_uygulamasi/filimler.dart';

class FilmlerDetaySayfa extends StatefulWidget {
  Filmler film;
  FilmlerDetaySayfa({required this.film});

  @override
  State<FilmlerDetaySayfa> createState() => _FilmlerDetaySayfaState();
}

class _FilmlerDetaySayfaState extends State<FilmlerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var f = widget.film;
    return Scaffold(
      appBar: AppBar(
        title: Text(f.filmAdi),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${f.filmResimAdi}"),
            Text(
              "${f.filmFiyat} ₺",
              style: TextStyle(fontSize: 48, color: Colors.blue),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  onPressed: () {
                    print("${f.filmAdi} kiralandı");
                  },
                  child: Text(
                    "Kirala",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
