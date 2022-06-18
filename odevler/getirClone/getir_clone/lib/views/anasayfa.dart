// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:getir_clone/entity/kategoriler.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int secilenIndeks = 0;
  Future<List<Kategoriler>> kategorileriGetir() async {
    var kategoriListesi = <Kategoriler>[];
    var k1 = Kategoriler(imageLink: "kategori0.jpg", imageString: "Dondurma");
    var k2 = Kategoriler(imageLink: "kategori1.jpg", imageString: "Temel Gıda");
    var k3 = Kategoriler(imageLink: "kategori2.jpg", imageString: "Deterjan");
    var k4 = Kategoriler(imageLink: "kategori3.jpg", imageString: "Cinsellik");
    var k5 = Kategoriler(imageLink: "kategori4.jpg", imageString: "Bebek");
    var k6 = Kategoriler(imageLink: "kategori5.jpg", imageString: "Dondurma");
    var k7 =
        Kategoriler(imageLink: "kategori6.jpg", imageString: "Atıştırmalık");
    var k8 = Kategoriler(imageLink: "kategori7.jpg", imageString: "Fırından");
    var k9 =
        Kategoriler(imageLink: "kategori9.jpg", imageString: "Kahvaltılık");
    var k10 = Kategoriler(imageLink: "kategori10.jpg", imageString: "Yiyecek");
    var k11 =
        Kategoriler(imageLink: "kategori11.jpg", imageString: "Fit & Form");
    var k12 = Kategoriler(imageLink: "kategori12.jpg", imageString: "Dondurma");
    var k13 =
        Kategoriler(imageLink: "kategori13.jpg", imageString: "Kişisel Bakım");
    var k14 =
        Kategoriler(imageLink: "kategori14.jpg", imageString: "Meyve & Sebze");
    var k15 = Kategoriler(imageLink: "kategori15.jpg", imageString: "Dondurma");
    var k16 = Kategoriler(imageLink: "kategori16.jpg", imageString: "Dondurma");
    var k17 = Kategoriler(imageLink: "kategori17.jpg", imageString: "İçecek");
    kategoriListesi.add(k1);
    kategoriListesi.add(k2);
    kategoriListesi.add(k3);
    kategoriListesi.add(k17);
    kategoriListesi.add(k14);
    kategoriListesi.add(k13);
    kategoriListesi.add(k7);
    kategoriListesi.add(k8);
    kategoriListesi.add(k9);
    kategoriListesi.add(k10);
    kategoriListesi.add(k11);
    kategoriListesi.add(k5);
    kategoriListesi.add(k6);
    kategoriListesi.add(k12);
    kategoriListesi.add(k15);
    kategoriListesi.add(k16);
    kategoriListesi.add(k4);
    return kategoriListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "getir",
          style: TextStyle(
              fontFamily: "Cocon", fontSize: 40, color: Colors.yellow),
        )),
      ),
      body: Column(
        children: [
          adresKismi(context),
          Expanded(
            child: Column(
              children: [
                sliderMenu(context),
                Expanded(
                  child: FutureBuilder<List<Kategoriler>>(
                    future: kategorileriGetir(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var kategoriListesi = snapshot.data;
                        return GridView.builder(
                          //shrinkWrap: true, // ne işe yarıyor bak
                          itemCount: kategoriListesi!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (context, indeks) {
                            var kategori = kategoriListesi[indeks];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 1, bottom: 4, right: 15, left: 15),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(11)),
                                    //clipBehavior: Clip.antiAliasWithSaveLayer,
                                    elevation: 4,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(11),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      type: MaterialType.transparency,
                                      child: Image.asset(
                                        "assets/images/${kategori.imageLink}",
                                        //fit: BoxFit.cover,
                                        //height: 70,
                                        //width: double.infinity,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(kategori.imageString,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54)),
                              ],
                            );
                          },
                        );
                      } else {
                        return Center();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Colors.white,
        child: Icon(
          Icons.hive_rounded,
          color: Colors.deepPurple,
          size: 40,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: bottomNavi(),
    );
  }

  SizedBox sliderMenu(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
          unlimitedMode: true,
          enableAutoSlider: true,
          slideBuilder: ((index) {
            return Image.asset(
              "assets/images/resim$index.png",
              fit: BoxFit.fill,
            );
          }),
          itemCount: 2),
    );
  }

  Stack adresKismi(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 60.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'TVS\n',
                      style: TextStyle(
                          color: Color.fromARGB(255, 41, 98, 255),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '11',
                            style: TextStyle(
                                color: Color.fromARGB(255, 41, 98, 255),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'dk',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 41, 98, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              )
                            ])
                      ]),
                )
              ],
            ),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0))),
            height: 60.0,
            width: MediaQuery.of(context).size.width - 60,
            child: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.home, size: 22.0),
                ),
                SizedBox(width: 10.0),
                Text(
                  "Ev",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                SizedBox(width: 5.0),
                Expanded(
                  child: SizedBox(
                    width: 200.0,
                    child: Text(
                      "Kubilay Sokak No: 21/12",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      softWrap: false,
                      style: TextStyle(),
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      size: 28.0,
                      color: Color.fromARGB(255, 41, 98, 255),
                    ),
                    onPressed: null)
              ],
            )),
      ],
    );
  }

  BottomAppBar bottomNavi() {
    return BottomAppBar(
      elevation: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                size: 30,
                color: Colors.deepPurple,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 30,
                )),
          ),
          Stack(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.card_giftcard,
                  size: 30,
                )),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: CircleAvatar(
                radius: 10,
                child: Text(
                  "27",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }
}
