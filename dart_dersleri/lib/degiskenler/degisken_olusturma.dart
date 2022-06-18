// ignore_for_file: unused_local_variable, avoid_print

void main(){
  var ogrenciAdi = "Osman Murat Haşlak";
  var ogrenciYas = 24;
  var ogrenciBoyu = 1.86;
  var ogrenciBasharfi = "O";
  var ogrenciDevamEdiyorMu = true;

  print(ogrenciAdi);
  print(ogrenciYas);
  print(ogrenciBoyu);
  print(ogrenciBasharfi);
  print(ogrenciDevamEdiyorMu);

  //int double,bool => primitif tipler
  //String => referans tipler
  //Sınıf isimleri büyük harfle başlar

  int urunId = 3416; //white space
  String urunAdi = "Kol Saati";
  int urunAdet = 100;
  double urunFiyat = 149.99;
  String urunTedarikci = "Rolex";

  print("Ürün id : $urunId");
  print("Ürün adı : $urunAdi");
  print("Ürün adet : $urunAdet");
  print("Ürün fiyatı : $urunFiyat ");
  print("Ürün tedarikçi : $urunTedarikci");

  int a = 100;
  int b = 200;

  print("$a ve $b toplamı: ${a+b}");

  //Sabitler - Constant

  int sayi = 30;
  sayi = 40;
  print(sayi);

  //Kodlamayı çalıştırdığımızda hafızada yer ayırır.
  //Derleme sonrası
  final int sonuc = 100;

  //Değikeni tanımladığımız an hafızada yer ayırır.
  //Derleme öncesi
  //Görsel nesne kodlamalarında bol bol kullanılır.
  const double pi = 3.14;





}