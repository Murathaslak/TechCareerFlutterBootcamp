// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Business',
    ),
    Text(
      'Index 2: School',
    ),
    Text(
      'Index 3: Settings',
    ),
    Text(
      'Index 4: Settings',
    ),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Stack(children: [
                      Icon(
                        Icons.account_circle,
                        size: 30,
                        color: Colors.white,
                      ),
                      Positioned(
                        left: 15,
                        bottom: 15,
                        child: Icon(
                          Icons.photo_camera,
                          color: Colors.purple,
                          size: 15,
                        ),
                      )
                    ])),
              )
            ],
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            title: Container(
                width: 80, height: 80, child: Image.asset("images/papara.jpg")),
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: Colors.grey))),
                    onPressed: () {},
                    child: Center(
                      child: SizedBox(
                        width: 129,
                        child: Row(
                          children: [
                            Text(
                              "Türk Lirası  ",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                                width: 20,
                                height: 20,
                                child: Image.asset("images/turk.png")),
                            Text(
                              "   TL",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.expand_more,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.remove_circle_outline,
                      size: 42,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "₺200,00",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 42,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Çek",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(
                    "Papara Numaran:",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Yatır",
                        style: TextStyle(color: Colors.grey),
                      )),
                ],
              ),
              Divider(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "SON İŞLEMLER ->",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "SS",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                  backgroundColor: Colors.grey.shade500,
                ),
                title: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "₺100.00",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                selectedTileColor: Colors.green,
                subtitle: Container(
                  alignment: Alignment.topRight,
                  child: Text("Bugün 09:30",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  child: Text(
                    "UA",
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.grey.shade500,
                ),
                title: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "₺100.00",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                selectedTileColor: Colors.green,
                subtitle: Container(
                  alignment: Alignment.topRight,
                  child: Text("Bugün 17:03",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "CASHBACK ->",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottomNavi());
  }

  BottomNavigationBar bottomNavi() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_rounded),
            label: 'QR İşlemleri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_sharp),
            label: 'Para Transferi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.corporate_fare),
            label: 'Ödemeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Papara Card',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped);
  }
}
