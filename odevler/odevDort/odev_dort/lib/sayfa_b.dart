import 'package:flutter/material.dart';
import 'package:odev_dort/sayfa_y.dart';

class SayfaB extends StatefulWidget {
  SayfaB({Key? key}) : super(key: key);

  @override
  State<SayfaB> createState() => _SayfaBState();
}

class _SayfaBState extends State<SayfaB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("SAYFA B")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SayfaY()));
              },
              child: Text("GİT > Y"),
            ),
          ],
        ),
      ),
    );
  }
}
