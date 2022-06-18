import 'package:flutter/material.dart';
import 'package:odev_dort/sayfa_y.dart';

class SayfaX extends StatefulWidget {
  SayfaX({Key? key}) : super(key: key);

  @override
  State<SayfaX> createState() => _SayfaXState();
}

class _SayfaXState extends State<SayfaX> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("SAYFA X")),
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
