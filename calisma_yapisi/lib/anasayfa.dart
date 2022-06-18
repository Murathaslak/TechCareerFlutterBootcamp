import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> with WidgetsBindingObserver {
  int sayac = 0;
  bool kontrol = false;

  @override
  void initState() {
    super.initState();
    print("initState çalıştı");
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.inactive) {
      print("inactive çalıştı");
    }
    if (state == AppLifecycleState.paused) {
      print("paused çalıştı");
    }
    if (state == AppLifecycleState.resumed) {
      print("resumed çalıştı");
    }
    if (state == AppLifecycleState.detached) {
      print("detached çalıştı");
    }
  }

  Future<int> faktoriyelHesaplama(int sayi) async {
    int sonuc = 1;
    for (var i = 1; i <= sayi; i++) {
      sonuc = sonuc * i;
    }
    return sonuc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Sonuç : $sayac"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    sayac = sayac + 1;
                  });
                },
                child: const Text("Tıkla")),
            ElevatedButton(
                onPressed: () {
                  var kisi =
                      Kisiler(ad: "Osman", yas: 24, boy: 1.86, bekar: true);
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => OyunEkrani(kisi: kisi))))
                      .then((_) => {
                            print("Anasayfaya geri dönüldü"),
                          });
                },
                child: const Text("Başla")),
            Visibility(
              child: const Text("Merhaba"),
              visible: kontrol,
            ),
            Text(
              kontrol ? "Merhaba" : "X",
              style: TextStyle(color: kontrol ? Colors.blue : Colors.red),
            ),
            (() {
              if (kontrol) {
                return Text("Merhaba");
              } else {
                return Text("X");
              }
            }()),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = true;
                  });
                },
                child: const Text("DURUM 1 (True)")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    kontrol = false;
                  });
                },
                child: const Text("DURUM 2 (False)")),
            FutureBuilder<int>(
              future: faktoriyelHesaplama(5),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Hata oluştu");
                }
                if (snapshot.hasData) {
                  return Text("Sonuç : ${snapshot.data}");
                } else {
                  return const Text("Sonuç yok");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
