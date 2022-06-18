// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubit/kayit_cubit.dart';


class KisiKayitSayfa extends StatefulWidget {
  KisiKayitSayfa({Key? key}) : super(key: key);

  @override
  State<KisiKayitSayfa> createState() => _KisiKayitSayfaState();
}

class _KisiKayitSayfaState extends State<KisiKayitSayfa> {
  var tfKisiAdi = TextEditingController();
  var tfKisiTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yapılacak İş Kayıt")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(hintText: "Yapılacak İş"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<KayitCubit>()
                        .kayit(tfKisiAdi.text, tfKisiTel.text);
                  },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
