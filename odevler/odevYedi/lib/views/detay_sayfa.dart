// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubit/detay_cubit.dart';
import 'package:todoapp/entity/yapilacak.dart';


class KisiDetaySayfa extends StatefulWidget {
  Yapilacak yapilacak;
  KisiDetaySayfa({required this.yapilacak});

  @override
  State<KisiDetaySayfa> createState() => _KisiDetaySayfaState();
}

class _KisiDetaySayfaState extends State<KisiDetaySayfa> {
  var tfKisiTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var yapilacak = widget.yapilacak;
    tfKisiTel.text = yapilacak.yapilacak_is;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yapılacak Detay")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfKisiTel,
                decoration: InputDecoration(hintText: "Yapılacak İş Detay"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<DetayCubit>().guncelle(
                        widget.yapilacak.yapilacak_id, tfKisiTel.text);
                  },
                  child: Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
