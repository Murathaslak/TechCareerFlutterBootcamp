// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OdevBes(),
    );
  }
}

class OdevBes extends StatefulWidget {
  @override
  _OdevBesState createState() => _OdevBesState();
}

class _OdevBesState extends State<OdevBes> {
  String hesaplamalar = "0";
  String butunText = "";

  butonTiklama(String tiklananSayi) {
    setState(() {
      if (tiklananSayi == "Sıfırla") {
        hesaplamalar = "0";
      } else if (tiklananSayi == "=") {
        butunText = hesaplamalar;

        Parser p = Parser();
        Expression exp = p.parse(butunText);

        ContextModel cm = ContextModel();
        hesaplamalar = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } else {
        if (hesaplamalar == "0") {
          hesaplamalar = tiklananSayi;
        } else {
          hesaplamalar = hesaplamalar + tiklananSayi;
        }
      }
    });
  }

  Widget butonOlustur(String tiklananSayi) {
    return Container(
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(shape: StadiumBorder()),
          onPressed: () => butonTiklama(tiklananSayi),
          child: Text(
            tiklananSayi,
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.normal,
                color: Colors.white),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Odev')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: Text(
              hesaplamalar,
              style: TextStyle(fontSize: 38),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              butonOlustur("7"),
              butonOlustur("8"),
              butonOlustur("9"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              butonOlustur("4"),
              butonOlustur("5"),
              butonOlustur("6"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              butonOlustur("1"),
              butonOlustur("2"),
              butonOlustur("3"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              butonOlustur("+"),
              butonOlustur("="),
              butonOlustur("Sıfırla"),
            ],
          ),
        ],
      ),
    );
  }
}
