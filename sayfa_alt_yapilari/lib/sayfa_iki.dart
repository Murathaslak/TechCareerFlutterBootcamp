import 'package:flutter/material.dart';

class SayfaIki extends StatefulWidget {
  const SayfaIki({Key? key}) : super(key: key);

  @override
  State<SayfaIki> createState() => _SayfaIkiState();
}

class _SayfaIkiState extends State<SayfaIki> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SAYFA 2",
        style: TextStyle(color: Colors.black45,fontSize: 30),
      ),
    );
  }
}
