// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SayfaBir extends StatefulWidget {
  SayfaBir({Key? key}) : super(key: key);

  @override
  State<SayfaBir> createState() => _SayfaBirState();
}

class _SayfaBirState extends State<SayfaBir> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SAYFA 1",
        style: TextStyle(color: Colors.black45,fontSize: 30),
      ),
    );
  }
}
