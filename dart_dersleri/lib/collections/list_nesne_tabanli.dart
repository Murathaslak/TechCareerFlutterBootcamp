import 'package:dart_dersleri/collections/ogrenciler.dart';

void main(){
  var o1 = Ogrenciler(no: 200, ad: "Osman", sinif: "9C");
  var o2 = Ogrenciler(no: 300, ad: "Murat", sinif: "12C");
  var o3 = Ogrenciler(no: 100, ad: "Haşlak", sinif: "6C");

  var ogrencilerListesi = <Ogrenciler>[];

  ogrencilerListesi.add(o1);
  ogrencilerListesi.add(o2);
  ogrencilerListesi.add(o3);

  for(var i in ogrencilerListesi){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }

  // x ve y nin arasındaki nolara göre kıyasla kücükten büyüğe doğru
  Comparator<Ogrenciler> siralama1 = (x,y) => x.no.compareTo(y.no);
  ogrencilerListesi.sort(siralama1);
  print("Sayısal Kücükten Büyüğe");

  for(var i in ogrencilerListesi){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }

  Comparator<Ogrenciler> siralama2 = (y,x) => x.no.compareTo(y.no);
  ogrencilerListesi.sort(siralama2);
  print("Sayısal Büyükten Küçüğe");

  for(var i in ogrencilerListesi){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }

  Comparator<Ogrenciler> siralama3 = (x,y) => x.no.compareTo(y.no);
  ogrencilerListesi.sort(siralama3);
  print("Metinsel Küçükten Büyüğe");

  for(var i in ogrencilerListesi){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }

  Comparator<Ogrenciler> siralama4 = (x,y) => y.no.compareTo(x.no);
  ogrencilerListesi.sort(siralama4);
  print("Metinsel Büyükten Küçüğe");

  for(var i in ogrencilerListesi){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }

  Iterable<Ogrenciler> filtreleme1 = ogrencilerListesi.where((ogrenciNesnesi){
    return ogrenciNesnesi.no > 100 ;
  });

  var f1Liste = ogrencilerListesi = filtreleme1.toList();
  print("Filtreleme 1");

  for(var i in f1Liste){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }

  Iterable<Ogrenciler> filtreleme2 = ogrencilerListesi.where((ogrenciNesnesi){
    return ogrenciNesnesi.ad.contains("t") ;
  });

  var f2Liste = filtreleme2.toList();
  print("Filtreleme 2");

  for(var i in f2Liste){
    print("No : ${i.no} - Ad : ${i.ad} - Sınıf : ${i.sinif}");
  }
  
  

  






}