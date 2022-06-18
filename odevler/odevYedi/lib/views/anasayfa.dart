// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubit/anasayfa_cubit.dart';
import 'package:todoapp/entity/yapilacak.dart';
import 'package:todoapp/views/detay_sayfa.dart';
import 'package:todoapp/views/kayit_sayfa.dart';

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
    context.read<AnasayfaCubit>().yapilacaklariYukle();
  }

  @override
  Widget build(BuildContext context) {
    var blocBuilder = BlocBuilder<AnasayfaCubit, List<Yapilacak>>(
        builder: (context, yapilacakListesi) {
      if (yapilacakListesi.isNotEmpty) {
        return ListView.builder(
          itemCount: yapilacakListesi.length,
          itemBuilder: (context, indeks) {
            var yapilacak = yapilacakListesi[indeks];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => KisiDetaySayfa(
                              yapilacak: yapilacak,
                            )))).then((_) {
                  context.read<AnasayfaCubit>().yapilacaklariYukle();
                });
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("${yapilacak.yapilacak_is}"),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "${yapilacak.yapilacak_is} silinsin mi?"),
                                action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context
                                          .read<AnasayfaCubit>()
                                          .sil(yapilacak.yapilacak_id);
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
    });
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu
            ? TextField(
                onChanged: (aramaSonucu) {
                  context.read<AnasayfaCubit>().ara(aramaSonucu);
                },
                decoration: InputDecoration(hintText: "Ara"),
              )
            : Text("Yapılacaklar"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: (() {
                    setState(() {
                      aramaYapiliyorMu = false;
                      context.read<AnasayfaCubit>().yapilacaklariYukle();
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
      body: blocBuilder,
      floatingActionButton: FloatingActionButton(
        child: Text(
          "+",
          style: TextStyle(fontSize: 40),
        ),
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => KisiKayitSayfa())))
              .then((_) {
            context.read<AnasayfaCubit>().yapilacaklariYukle();
          });
        },
      ),
    );
  }
}
