// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  double enlem = 0.0;
  double boylam = 0.0;

  Future<void> konumBilgisiAl() async {
    var konum = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konum Kullanımı")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Enlem : $enlem ",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "Boylam : $boylam ",
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
                onPressed: () {
                  konumBilgisiAl();
                },
                child: Text("Konum Bilgisi Al"))
          ],
        ),
      ),
    );
  }
}
