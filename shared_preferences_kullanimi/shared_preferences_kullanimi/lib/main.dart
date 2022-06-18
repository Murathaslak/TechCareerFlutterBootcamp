import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    sayacKontrol();
    //test();
  }

  Future<void> test() async {
    var sp = await SharedPreferences.getInstance();
    // Veri kaydı yapma
    sp.setString("ad", "Osman");

    sp.setInt("yas", 23);
    sp.setDouble("boy", 1.98);
    sp.setBool("bekar", true);

    var arkadasListe = <String>[];
    arkadasListe.add("Ece");
    arkadasListe.add("Ali");

    sp.setStringList("arkadasListe", arkadasListe);

    // Veri silme
    //sp.remove("ad");

    // Veri okuma
    String gelenAd = sp.getString("ad") ?? "isim yok";
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenBekar = sp.getBool("bekar") ?? false;
    var gelenArkadasListe = sp.getStringList("arkadasListe") ?? null;

    print("Gelen Ad : $gelenAd");
    print("Gelen Yaş : $gelenYas");
    print("Gelen Boy : $gelenBoy");
    print("Gelen Bekar : $gelenBekar");

    if (gelenArkadasListe != null) {
      for (var a in gelenArkadasListe) {
        print("Arkadaş : $a");
      }
    }
  }

  int sayac = 0;
  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();
    sayac = sp.getInt("sayac") ?? 0;
    setState(() {
      sayac += 1;
    });
    sp.setInt("sayac", sayac);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sayaç Uygulaması")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Açılış Sayısı : $sayac",
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
