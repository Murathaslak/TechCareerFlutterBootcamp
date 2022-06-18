// ignore_for_file: prefer_const_constructors

import 'package:bloc_pattern_kullanimi/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern Kullanımı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>(
                builder: (context, sonuc) {
                  return Text(
                    sonuc.toString(),
                    style: TextStyle(fontSize: 30),
                  );
                },
              ),
              TextField(
                controller: tfSayi1,
                decoration: InputDecoration(hintText: "Sayı 1"),
              ),
              TextField(
                controller: tfSayi2,
                decoration: InputDecoration(hintText: "Sayı 2"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        String alinanSayi1 = tfSayi1.text;
                        String alinanSayi2 = tfSayi2.text;
                        context
                            .read<AnasayfaCubit>()
                            .toplamaYap(alinanSayi1, alinanSayi2);
                      },
                      child: Text("Toplama")),
                  ElevatedButton(
                      onPressed: () {
                        String alinanSayi1 = tfSayi1.text;
                        String alinanSayi2 = tfSayi2.text;
                        context
                            .read<AnasayfaCubit>()
                            .carpmaYap(alinanSayi1, alinanSayi2);
                      },
                      child: Text("Çarpma"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
