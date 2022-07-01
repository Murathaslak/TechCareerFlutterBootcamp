import 'package:bootcamp_bitirme/cubit/sepet_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/cubit/yemek_detay_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/cubit/yemek_liste_sayfa_cubit.dart';
import 'package:bootcamp_bitirme/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YemekListeCubit()),
        BlocProvider(create: (context) => SepetSayfaCubit()),
        BlocProvider(create: (context) => YemekDetayCubit()),
        BlocProvider(create: (context) => SepetSayfaCubitIslem()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Anasayfa(),
      ),
    );
  }
}
