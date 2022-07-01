import 'package:bootcamp_bitirme/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnayEkran extends StatefulWidget {
  const OnayEkran({Key? key}) : super(key: key);

  @override
  State<OnayEkran> createState() => _OnayEkranState();
}

class _OnayEkranState extends State<OnayEkran> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30)),
                width: 250,
                height: 250,
                child: Lottie.network(
                    "https://assets9.lottiefiles.com/packages/lf20_vkqybeu5/data.json")),
            Text("Sipariş talebiniz alınmıştır."),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => Anasayfa())));
                },
                child: Text("Anasayfaya dön"))
          ],
        ),
      )),
    );
  }
}
