// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/views/kisi_detay.dart';
import 'package:kisiler_uygulamasi/views/kisi_kay%C4%B1t_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  bool aramaYapiliyorMu = false;
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
                decoration: InputDecoration(hintText: "Ara"),
              )
            : Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: (() {
                    setState(() {
                      aramaYapiliyorMu = false;
                      context.read<AnasayfaCubit>().kisileriYukle();
                    });
                  }),
                  icon: Icon(Icons.clear))
              : IconButton(
                  onPressed: (() {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  }),
                  icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Kisiler>>(
          builder: (context, kisilerListesi) {
        if (kisilerListesi.isNotEmpty) {
          return ListView.builder(
            itemCount: kisilerListesi.length,
            itemBuilder: (context, indeks) {
              var kisi = kisilerListesi[indeks];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => KisiDetaySayfa(
                                kisi: kisi,
                              )))).then((_) {
                    context.read<AnasayfaCubit>().kisileriYukle();
                  });
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${kisi.kisi_ad} silinsin mi?"),
                                  action: SnackBarAction(
                                      label: "Evet",
                                      onPressed: () {
                                        context
                                            .read<AnasayfaCubit>()
                                            .sil(kisi.kisi_id);
                                      }),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center();
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("Kayıt"),
        icon: Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.pinkAccent,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => KisiKayitSayfa())))
              .then((_) {
            context.read<AnasayfaCubit>().kisileriYukle();
          });
        },
      ),
    );
  }
}
