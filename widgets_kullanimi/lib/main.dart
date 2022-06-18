// ignore_for_file: prefer_const_constructors, avoid_print

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
  String alinanVeri = "";
  var tfController = TextEditingController();
  String resimAdi = "baklava.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  bool progressKontrol = false;
  double ilerleme = 50.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();
  var ulkelerListesi = <String>[];
  String secilenUlke = "Türkiye";

  @override
  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("İtalya");
    ulkelerListesi.add("Japonya");
  }

  int radioDeger = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widgets Kullanımı")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: tfController,
                  decoration: InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfController.text;
                    });
                  },
                  child: Text("Veriyi Al")),
              TextButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfController.text;
                    });
                  },
                  child: Text("Veriyi Al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimAdi = "kofte.png";
                        });
                      },
                      child: const Text("Resim 1")),
                  //Image.asset("resimler/$resimAdi"),
                  //SizedBox(
                  //width: 48,
                  //height: 48,
                  //child: Image.network(
                  //  "http://kasimdalan.pe.hu/yemekler/resimler/$resimAdi"),
                  //),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimAdi = "ayran.png";
                        });
                      },
                      child: const Text("Resim 2")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: SwitchListTile(
                        title: Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (bool? veri) {
                          setState(() {
                            switchKontrol = veri!;
                          });
                          print("Checkbox : $veri");
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: CheckboxListTile(
                        title: Text("Flutter"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxKontrol,
                        onChanged: (bool? veri) {
                          setState(() {
                            checkboxKontrol = veri!;
                          });
                          print("Checkbox : $veri");
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        title: Text("Barcelona"),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (int? veri) {
                          setState(() {
                            radioDeger = veri!;
                            print("Radio 1 : $veri:");
                          });
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        title: Text("Real Madrid"),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (int? veri) {
                          setState(() {
                            radioDeger = veri!;
                            print("Radio 2 : $veri");
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = true;
                        });
                      },
                      child: const Text("Başla")),
                  Visibility(
                      visible: progressKontrol,
                      child: CircularProgressIndicator()),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = false;
                        });
                      },
                      child: const Text("Dur")),
                ],
              ),
              Text(ilerleme.toInt().toString()),
              Slider(
                  max: 100.0,
                  min: 0.0,
                  value: ilerleme,
                  onChanged: (veri) {
                    setState(() {
                      ilerleme = veri;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 120,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Saat"),
                        controller: tfSaat,
                      )),
                  IconButton(
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()))
                            .then((secilenSaat) {
                          tfSaat.text =
                              "${secilenSaat!.hour} : ${secilenSaat.minute}";
                        });
                      },
                      icon: Icon(Icons.access_time_outlined)),
                  SizedBox(
                      width: 120,
                      child: TextField(
                        decoration: InputDecoration(hintText: "Tarih"),
                        controller: tfTarih,
                      )),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2300))
                            .then((secilenTarih) {
                          tfTarih.text =
                              "${secilenTarih!.day} / ${secilenTarih.month} / ${secilenTarih.year}";
                        });
                      },
                      icon: Icon(Icons.date_range))
                ],
              ),
              DropdownButton(
                  value: secilenUlke,
                  icon: Icon(Icons.arrow_drop_down),
                  items: ulkelerListesi.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? secilenVeri) {
                    setState(() {
                      secilenUlke = secilenVeri!;
                    });
                  }),
              GestureDetector(
                onTap: () {
                  print("Tek tıklandı");
                },
                onDoubleTap: () {
                  print("Çift tıklandı");
                },
                onLongPress: () {
                  print("Üzerine uzun basıldı");
                },
                child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print("Switch en son durum : $switchKontrol");
                    print("Checkbox en son durum : $checkboxKontrol");
                    print("RadioButton en son durum : $radioDeger");
                    print("Slider en son durum : ${ilerleme.toInt()}");
                    print("En son seçilen ülke : ${secilenUlke}");
                  },
                  child: const Text("Göster"))
            ],
          ),
        ),
      ),
    );
  }
}
