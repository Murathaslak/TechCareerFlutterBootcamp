
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/cubit/anasayfa_cubit.dart';
import 'package:todoapp/cubit/detay_cubit.dart';
import 'package:todoapp/cubit/kayit_cubit.dart';
import 'package:todoapp/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => KayitCubit(),
        ),
        BlocProvider(
          create: (context) => DetayCubit(),
        ),
        BlocProvider(
          create: (context) => AnasayfaCubit(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnaSayfa(),
      ),
    );
  }
}
