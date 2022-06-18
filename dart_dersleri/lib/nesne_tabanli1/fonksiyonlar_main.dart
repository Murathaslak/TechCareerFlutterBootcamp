import 'package:dart_dersleri/nesne_tabanli1/fonksiyonlar.dart';

void main(){
  var fonksiyonlar = Fonksiyonlar();
  fonksiyonlar.selamla();
  String gelenSelam = fonksiyonlar.donusluSelam();
  print("Gelen Sonuc : $gelenSelam");

  fonksiyonlar.selamla2("Osmaaaaaan");

  int gelenToplam = fonksiyonlar.sayilariTopla(10,20);
  print("Gelen Toplam : $gelenToplam");


}