import 'package:flutter/material.dart';

class SayfaUc extends StatefulWidget {
  const SayfaUc({Key? key}) : super(key: key);

  @override
  State<SayfaUc> createState() => _SayfaUcState();
}

class _SayfaUcState extends State<SayfaUc> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "SAYFA 3",
        style: TextStyle(color: Colors.black45,fontSize: 30),
      ),
    );
  }
}
