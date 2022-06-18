// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  var tfControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kullanıcı Etkileşimi")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Silmek istiyor musunuz?"),
                      action: SnackBarAction(
                          label: "Evet",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Silindi")));
                          }),
                    ),
                  );
                },
                child: Text("SnackBar (Varsayılan)")),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.white,
                      content: Text(
                        "İnternet Bağlantısı Yok !",
                        style: TextStyle(color: Colors.indigoAccent),
                      ),
                      action: SnackBarAction(
                          label: "TEKRAR DENE",
                          textColor: Colors.red,
                          onPressed: () {}),
                    ),
                  );
                },
                child: Text("SnackBar (Özel)")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Başlık"),
                        content: Text("İçerik"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                print("İptal seçildi");
                                Navigator.pop(context);
                              },
                              child: Text("İptal")),
                          TextButton(
                              onPressed: () {
                                print("Tamam seçildi");
                                Navigator.pop(context);
                              },
                              child: Text("Tamam")),
                        ],
                      );
                    },
                  );
                },
                child: Text("Alart (Varsayılan)")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Kayıt İşlemi"),
                        content: TextField(
                          controller: tfControl,
                          decoration: InputDecoration(hintText: "Veri"),
                        ),
                        backgroundColor: Colors.grey.shade300,
                        actions: [
                          TextButton(
                              onPressed: () {
                                print("İptal seçildi");
                                Navigator.pop(context);
                              },
                              child: Text("İptal")),
                          TextButton(
                              onPressed: () {
                                print("Alınan Veri : ${tfControl.text}");
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Kaydet",
                              )),
                        ],
                      );
                    },
                  );
                },
                child: Text("Alert (Özel)")),
          ],
        ),
      ),
    );
  }
}
