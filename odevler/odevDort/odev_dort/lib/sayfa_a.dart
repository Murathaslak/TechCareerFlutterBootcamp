import 'package:flutter/material.dart';
import 'package:odev_dort/sayfa_b.dart';

class SayfaA extends StatefulWidget {
  SayfaA({Key? key}) : super(key: key);

  @override
  State<SayfaA> createState() => _SayfaAState();
}

class _SayfaAState extends State<SayfaA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("SAYFA A")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SayfaB()));
              },
              child: Text("GİT > B"),
            ),
          ],
        ),
      ),
    );
  }
}
